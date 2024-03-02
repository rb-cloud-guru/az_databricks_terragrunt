#root location
include {
    path = find_in_parent_folders()
}

#currentpath
terraform {
    source = "../key-vault"
}

#dependencies
dependencies {
    paths = ["../resource-group", "../entraid"]
}

#dependency in order
dependency entraid {
    config_path = "../entraid"
    skip_outputs = false
    mock_outputs = {
        app_pwd = "gruntwork"
        app_client_id = "grunworktemp"
        tenant_id = "gruntworktemp3"
    }
}

#inputs
inputs = {
    app_client_id_value = dependency.entraid.outputs.app_client_id
    app_client_secret_value = dependency.entraid.outputs.app_pwd
    tenant_id_value = dependency.entraid.outputs.tenant_id
}


