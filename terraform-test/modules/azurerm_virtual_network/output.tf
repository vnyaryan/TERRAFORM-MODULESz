output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}
output "virtual_network_id"  {
   value = azurerm_virtual_network.vnet.id
}

output "virtual_network_resource_group" {
  value = azurerm_resource_group.resource_group.name
}
