# Resource Group for Storage Account 
resource "azurerm_resource_group" "diagresource_group" {
    name                = var.diag_storage_account_resource_group_name
    location            = var.diag_storage_account_resource_group_location
    tags                = var.diag_storage_account_resource_group_tags
}

# Storage Account
resource "azurerm_storage_account" "diagstorage" {
  depends_on               = [azurerm_resource_group.diagresource_group]
  name                     = var.diag_storage_account_name
  resource_group_name      = azurerm_resource_group.diagresource_group.name
  location                 = azurerm_resource_group.diagresource_group.location
  account_tier             = var.diag_storage_account_tier
  account_replication_type = var.diag_storage_account_tier_replication_type
  
  
  
}




