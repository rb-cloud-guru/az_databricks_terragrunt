
#backend
remote_state {
    backend = "azurerm"
    config = {
        resource_group_name = "tfstorage"
        storage_account_name = "terraformrocks"
        container_name = "maroc2"
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
    rg_name = ""
    storage_account_name = ""
    storage_account_tier = "Standard"
    storage_account_type = "LRS"
    storage_account_container_name = "italia"
    storage_account_container_access_type = "private"
    cont_access_type = "private"
    bronze_cont_name = ""
    silver_cont_name = ""
    gold_cont_name = ""
    key_vault_name = ""
    key_vault_sku = "standard"
    app_name = ""
    app_name_pwd = ""
    role_def_name = ""
    app_client_id_name = ""
    app_client_secret_name = ""
    tenant_id_name = ""
    dbricks_wkspace_name = ""
    dbricks_wkspace_sku = "standard"
    dbricks_scope_name = ""
    dbricks_cluster_name = ""

 }

 

