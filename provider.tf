terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.94.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.5.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.47.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.10.0"
    }
  }
} 
provider "azurerm" {
  features {}
  subscription_id = ""
  client_id = ""
  client_secret = ""
  tenant_id = ""
}
