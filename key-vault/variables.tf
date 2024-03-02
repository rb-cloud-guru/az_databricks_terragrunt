#region
variable location {
    description = "Location"
}

#rg name
variable rg_name {
    description = "Resource Group Name"
}

#keyvault name
variable key_vault_name {
    description = "key vault name"
}

#keyvault sku
variable key_vault_sku {
    description = "Key vault sku"
}

#client id name 
variable "app_client_id_name" {
    description = "client_id name"
}

#client id value
variable "app_client_id_value" {
    description = "client_id value"
}

#client secret name
variable "app_client_secret_name" {
    description = "client_secret name "
}

#client secret value
variable "app_client_secret_value" {
    description = "client secret value"
}

#tenant id name
variable "tenant_id_name" {
    description = "tenant id name"
}

#tenant id value
variable "tenant_id_value" {
  description = "tenant id value"
}
