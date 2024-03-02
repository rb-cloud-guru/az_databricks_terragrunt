#locals
locals {
  env = "Dev"
}

#resource provider
provider "azurerm" {
	features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

#access the config of the azurem provider 
data "azurerm_client_config" "current" {}

#keyvault creation
resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = var.key_vault_sku

  tags = {
    Enviornment = local.env
  }
}

#keyvault access policy
resource "azurerm_key_vault_access_policy" "adb" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
    secret_permissions = ["Get", "List", "Set", "Delete", "Purge"]
 }

#spn client id
resource "azurerm_key_vault_secret" "databricks_clientid" {
  name         = var.app_client_id_name
  value        = var.app_client_id_value
  key_vault_id = azurerm_key_vault.kv.id 
   #dependency on kv explicit
  depends_on = [
    azurerm_key_vault_access_policy.adb
  ]
}

#spn client secret
resource "azurerm_key_vault_secret" "databricks_clientsecret" {
  name         = var.app_client_secret_name
  value        = var.app_client_secret_value
  key_vault_id = azurerm_key_vault.kv.id 
   #dependency on kv explicit
  depends_on = [
    azurerm_key_vault_access_policy.adb
  ]
}

#tenant client id
resource "azurerm_key_vault_secret" "tenantid" {
  name         = var.tenant_id_name 
  value        = var.tenant_id_value
  key_vault_id = azurerm_key_vault.kv.id 
   #dependency on kv explicit
  depends_on = [
    azurerm_key_vault_access_policy.adb 
  ]
}

