#resource provider
provider "azurerm" {
	features {}
}

#current config 
data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

#app creation
resource "azuread_application" "app" {
  display_name     = var.app_name
  #logo_image       = filebase64("${path.module}/adb.jpeg")
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMyOrg"
}

#create DataBricks Service Principal
resource "azuread_service_principal" "spn" {
  client_id                    = azuread_application.app.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  feature_tags {
    enterprise = true
    gallery    = true
  }
}

#password rotation 
resource "time_rotating" "pwd" {
  rotation_days = 7
}

#create secret for App
resource "azuread_application_password" "dbricks_app_sec" {
  display_name         = var.app_name_pwd
  application_id = azuread_application.app.id
  
  rotate_when_changed = {
    rotation = time_rotating.pwd.id
  }
}

#assign role to service principal
resource "azurerm_role_assignment" "spn_role" {
  scope                = var.storage_acct_id ###dependency
  role_definition_name = var.role_def_name
  principal_id         = azuread_service_principal.spn.id
}
