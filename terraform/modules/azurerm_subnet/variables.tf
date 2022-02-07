variable "subnet_name" {
    type = string
}

variable "subnet_address_prefixes" {
    type = list
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
    type = bool
}

variable "subnet_virtual_network_name" {
    type = string
}

variable "subnet_resource_group_name" {
    type = string
}

  