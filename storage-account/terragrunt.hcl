#path to root HCL
include {
    path = find_in_parent_folders()
}

#current path
terraform {
  source = "../storage-account"
}

#dependency
dependencies {
  paths = ["../resource-group"]
}
