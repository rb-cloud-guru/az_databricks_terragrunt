
#locals
locals {
  env = "Dev"
}

#Azure Provider
provider "azurerm" {
	features {}
}

#create a storage account for the azure function
resource "azurerm_storage_account" "dbricks" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_type
  is_hns_enabled           =  true
  
#tags
  tags = {
    Enviornment = local.env
  }
}

# Create containers for bronze, silver and gold layer
resource "azurerm_storage_container" "databronze" {
  name                  = var.bronze_cont_name
  storage_account_name  = azurerm_storage_account.dbricks.name
  container_access_type = var.cont_access_type
}

resource "azurerm_storage_container" "datasilver" {
  name                  = var.silver_cont_name
  storage_account_name  = azurerm_storage_account.dbricks.name
  container_access_type = var.cont_access_type
}

resource "azurerm_storage_container" "datagold" {
  name                  = var.gold_cont_name
  storage_account_name  = azurerm_storage_account.dbricks.name
  container_access_type = var.cont_access_type
}
