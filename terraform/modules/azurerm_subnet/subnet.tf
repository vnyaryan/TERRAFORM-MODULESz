#SUBNET
resource "azurerm_subnet" "subnet" {
  name                 = var.virtual_network_subnet_name
  resource_group_name  = var.virtual_network_resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.virtual_network_subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = var.virtual_network_subnet_enforce_private_link_endpoint_network_policies
}