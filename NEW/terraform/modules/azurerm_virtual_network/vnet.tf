# Resource Group for VNET
resource "azurerm_resource_group" "resource_group" {
  name                = var.virtual_network_resource_group_name
  location            = var.virtual_network_resource_group_location
  tags                = var.virtual_network_resource_group_tags
}

#VNET
resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.resource_group]
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.virtual_network_resource_group_location
  resource_group_name = var.virtual_network_resource_group_name
  tags                = var.virtual_network_resource_group_tags
}


#SUBNET
resource "azurerm_subnet" "subnet" {
  depends_on          = [azurerm_virtual_network.vnet]
  name                 = var.virtual_network_subnet_name
  resource_group_name  = var.virtual_network_resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.virtual_network_subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = var.virtual_network_subnet_enforce_private_link_endpoint_network_policies
}

# Azure Action Group for all metric
resource "azurerm_monitor_action_group" "actiongroup" {
  depends_on          = [azurerm_resource_group.resource_group]
  name                = var.virtual_network_monitor_action_group_name
  resource_group_name = var.virtual_network_resource_group_name
  short_name          = var.virtual_network_monitor_action_group_name_short_name

  dynamic "email_receiver" {
   for_each = local.emailid
   content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.emailid
    }    
 }
}

# Diagnostic setting  to Send logs/metrics  to Log Analytics workspace  and   Archive to a storage account
resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  depends_on                  = [azurerm_virtual_network.vnet]
  name                        = var.virtual_network_monitor_diagnostic_setting_vnet_name
  target_resource_id          = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_workspace_id
  storage_account_id          = var.azurerm_storage_account_diagstorage_id
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = var.virtual_network_monitor_diagnostic_setting_metric_AllMetrics_status
      days    = var.virtual_network_monitor_diagnostic_setting_metric_AllMetrics_days
    }
  }

  log {
    category = "VMProtectionAlerts"
    enabled  = true

    retention_policy {
      enabled = var.virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_status
      days    = var.virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_days
    }
  }
}

# Azure Metric alert for  metric - IfUnderDDoSAttack
resource "azurerm_monitor_metric_alert" "metriclaert1" {
  depends_on          = [azurerm_virtual_network.vnet]
  name                =  "alert01"
  resource_group_name =  var.virtual_network_resource_group_name
  scopes              =   [azurerm_virtual_network.vnet.id]
  window_size         =  "PT1H"
  frequency           =  "PT1H"
  enabled             =   var.virtual_network_azurerm_monitor_metric_metriclaert1

  criteria {
    metric_namespace = "Microsoft.Network/virtualNetworks"
    metric_name      = "IfUnderDDoSAttack"
    aggregation      = "Maximum"
    operator         = var.virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_operator
    threshold        = var.virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}

# Azure Metric alert for  metric - BytesInDDoS
resource "azurerm_monitor_metric_alert" "metriclaert2" {
  depends_on          = [azurerm_virtual_network.vnet]
  name                =   "alert02"
  resource_group_name =  var.virtual_network_resource_group_name
  scopes              =   [azurerm_virtual_network.vnet.id]
  window_size         =  "PT1H"
  frequency           =  "PT1H"
  enabled             =   var.virtual_network_azurerm_monitor_metric_metriclaert2

  criteria {
    metric_namespace = "Microsoft.Network/virtualNetworks"
    metric_name      = "BytesInDDoS"
    aggregation      = "Maximum"
    operator         = var.virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_operator
    threshold        = var.virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}