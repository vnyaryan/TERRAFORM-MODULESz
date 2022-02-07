variable "virtual_network_subnet_name" {
    type = string
}

variable "virtual_network_subnet_address_prefixes" {
    type = list
}

variable "virtual_network_subnet_enforce_private_link_endpoint_network_policies" {
    type = bool
}

variable "virtual_network_resource_group_name" {
    type = string
}

variable "virtual_network_name" {
    type = string
}
