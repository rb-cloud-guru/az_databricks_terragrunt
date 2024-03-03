
#backend
remote_state {
    backend = "azurerm"
    config = {
        resource_group_name = "tfstorage"
        storage_account_name = "terraformrocks"
        container_name = "eznaidi"
        key = "${path_relative_to_include()}/terraform.tfstate"
    }
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
  }
}

#var sthg like tfvars
inputs = {
    location = "eastus"
    rg_name = "azuremoro"
    storage_account_name = "nerrafort98"
    storage_account_tier = "Standard"
    storage_account_type = "LRS"
    storage_account_container_name = "italia"
    storage_account_container_access_type = "private"
    cont_access_type = "private"
    bronze_cont_name = "bronzehamid"
    silver_cont_name = "silverhamid"
    gold_cont_name = "goldhamid"
    key_vault_name = "ninoloi"
    key_vault_sku = "standard"
    app_name = "data_ad_app_name"
    app_name_pwd = "app_name_pwd"
    role_def_name = "Storage Blob Data Contributor"
    app_client_id_name = "clientidname"
    app_client_secret_name = "clientsecretname"
    tenant_id_name = "tito8"
    dbricks_wkspace_name = "bricksspace"
    dbricks_wkspace_sku = "standard"
    dbricks_scope_name = "hammouda29"
    dbricks_cluster_name = "casablanca40"

 }

 

