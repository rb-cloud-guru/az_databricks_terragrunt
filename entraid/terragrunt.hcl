
#root location
include {
    path = find_in_parent_folders()
}

#currentpath      
terraform {
    source = "../entraid"
}

#dependencies 
dependencies {
    paths = ["../storage-account"]
}

#dependency in order
dependency storage-account {
    config_path = "../storage-account"
    skip_outputs = false
    mock_outputs = {
       storage_account_id = "/subscriptions/19v684o3"
    }
}

#inputs
inputs = {
    storage_acct_id = dependency.storage-account.outputs.storage_account_id  
}
