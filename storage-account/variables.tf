#region
variable location {
    description = "Location of the Virtual Net"
}

#rg name
variable rg_name {
    description = "Resource Group Name for the virtual net"
}

#storage name
variable storage_account_name {
    description = "The name of the Storage Account Name"
} 

#storage tier
variable storage_account_tier {
    description = "The tier of the Storage Account"
} 

#storage replication type
variable storage_account_type {
    description = "The replication type of the Storage Account"
} 

#storage container access type
variable "cont_access_type" {
    description = "The container access type"
}

#storage classification bornze
variable "bronze_cont_name" {
    description = "The container classif type"
}

#storage classification gold
variable "gold_cont_name" {
    description = "The container classif type"
}

#storage classification silver
variable "silver_cont_name" {
    description = "The container classif type"
}


