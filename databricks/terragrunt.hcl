
#root location
include {
    path = find_in_parent_folders()
}

#currentpath
terraform {
    source = "../resource-group"
}

#dependency
dependencies {
    paths = ["../resource-group", "../key-vault"]
}

#dependency in order
dependency key-vault {
    config_path = "../key-vault"
    skip_outputs = false
    mock_outputs = {
        keyvault_id = "hamzaisaswesome"
        keyvault_uri = "someurlofsomething"
    }
}

#inputs
inputs = {
    kvdatabricks_id = dependency.key-vault.outputs.keyvault_id
    kvdatabricks_vault_uri = dependency.key-vault.outputs.keyvault_uri
}
