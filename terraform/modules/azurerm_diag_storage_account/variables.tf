variable "diag_storage_account_resource_group_name" {
      type        = string
      description = "name of Resource Group"
}

variable "diag_storage_account_resource_group_location" {
   type        = string
   description = "location of Resource Group"
}

variable "diag_storage_account_resource_group_tags" {
    type        = map
    description = "tags for resource Group"
}

variable "diag_storage_account_name" {
    type = string
}

variable "diag_storage_account_tier" {
    type = string
}

variable "diag_storage_account_tier_replication_type" {
    type = string
}

