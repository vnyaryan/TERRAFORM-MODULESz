resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.log_analytics_workspace_location
  resource_group_name = var.log_analytics_workspace_resource_group_name
  sku                 = var.log_analytics_workspace_sku
  tags                = var.log_analytics_workspace_tags
}