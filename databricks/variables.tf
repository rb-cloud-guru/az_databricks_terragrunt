#region
variable location {
    description = "Location"
}

#rg name
variable rg_name {
    description = "Resource Group Name"
}

#databricks workspace
variable "dbricks_wkspace_name" {
    description = "workspace name"
}

#databricks workspace sku
variable "dbricks_wkspace_sku" {
    description = "workspace sku"
}

#databricks scope name
variable "dbricks_scope_name" {
    description = "databricks scope name"
}

#keyvault id
variable "kvdatabricks_id" {
    description = "keyvault id"
}

#keyvault name
variable "kvdatabricks_vault_uri" {
    description = "keyvault uri"
}

#databricks cluster name
variable "dbricks_cluster_name" {
    description = "databricks cluster name"
}

