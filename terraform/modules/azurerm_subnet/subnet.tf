#SUBNET
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_resource_group_name
  virtual_network_name = var.subnet_virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
}