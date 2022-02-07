output "storage_account_id" {
  value = azurerm_storage_account.diagstorage.id
}

output "resource_group_name" {
  value = azurerm_resource_group.diagresource_group.name
}
output "resource_group_location" {
  value = azurerm_resource_group.diagresource_group.location
}
output "resource_group_id"  {
   value = azurerm_resource_group.diagresource_group.id
}