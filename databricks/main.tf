#locals
locals {
  env = "Dev"
}

#resource provider
provider "azurerm" {
	features {}  
}

#create databricks workspace
resource "azurerm_databricks_workspace" "dbricks_wkspace" {
  name                = var.dbricks_wkspace_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.dbricks_wkspace_sku

  tags = {
    Environment = local.env
  }
}

#create Databricks Cluster
data "databricks_node_type" "smallest" {
  local_disk = true
  category   = "General Purpose"
}

data "databricks_spark_version" "latest" {
  latest = true
  long_term_support = true
  depends_on = [ azurerm_databricks_workspace.dbricks_wkspace ]
}

# Create Databricks Scope
resource "databricks_secret_scope" "dbricks_scope" {
  name = var.dbricks_scope_name
  initial_manage_principal = "users"
  depends_on = [ azurerm_databricks_workspace.dbricks_wkspace ]
  
  keyvault_metadata {
    resource_id = var.kvdatabricks_id
    dns_name    = var.kvdatabricks_vault_uri
  }
}

#create Single Node Cluster
resource "databricks_cluster" "dbricks_cluster" {
  cluster_name            = var.dbricks_cluster_name
  spark_version           = data.databricks_spark_version.latest.id # Other possible values ("13.3.x-scala2.12", "11.2.x-cpu-ml-scala2.12", "7.0.x-scala2.12")
  node_type_id            = data.databricks_node_type.smallest.id # Other possible values ("Standard_F4", "Standard_DS3_v2")
  autotermination_minutes = 20
  depends_on              = [ databricks_secret_scope.dbricks_scope ]
  autoscale {
    min_workers = 1
    max_workers = 3
  }

}