# Resource Group for Storage Account 
resource "azurerm_resource_group" "resource_group" {
  name                = var.storage_account_resource_group_name
  location            = var.storage_account_resource_group_location
  tags                = var.storage_account_resource_group_tags
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  depends_on               = [azurerm_resource_group.resource_group]
  name                     = var.storage_account_name
  resource_group_name      = var.storage_account_resource_group_name
  location                 = var.storage_account_resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_tier_replication_type
  access_tier              = var.storage_account_access_tier
  min_tls_version          = var.storage_account_min_tls_version
  tags                     = var.storage_account_resource_group_tags
}

# Action Group for all metric
resource "azurerm_monitor_action_group" "actiongroup" {
  depends_on          = [azurerm_resource_group.resource_group]
  name                = var.storage_account_monitor_action_group_name
  resource_group_name = var.storage_account_resource_group_name
  short_name          = var.storage_account_monitor_action_group_name_short_name
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
  depends_on                  = [azurerm_storage_account.storage ]
  name                        = var.storage_account_monitor_diagnostic_setting_storage_name
  target_resource_id          = azurerm_storage_account.storage.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_workspace_id
  storage_account_id          = var.azurerm_storage_account_diagstorage_id
  metric {
    category  = "Transaction"
    retention_policy {
      enabled = var.storage_account_monitor_diagnostic_setting_storage_metric_Transaction_status
      days    = var.storage_account_monitor_diagnostic_setting_storage_metric_Transaction_days
    }
  }
}

# Azure Metric alert for  metric - Availability
resource "azurerm_monitor_metric_alert" "metriclaert01" {
  depends_on          = [azurerm_storage_account.storage ]
  name                = "alert01"
  resource_group_name = var.storage_account_resource_group_name
  scopes              = [azurerm_storage_account.storage.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.storage_account_azurerm_monitor_metriclaert01

  criteria {
    metric_namespace  = "Microsoft.Storage/storageAccounts"
    metric_name       = "Availability"
    aggregation       = "Average"
    operator          = var.storage_account_azurerm_monitor_metric_alert_Availability_operator
    threshold         = var.storage_account_azurerm_monitor_metric_alert_Availability_threshold
  }

  action {
    action_group_id   = azurerm_monitor_action_group.actiongroup.id
  }
}

# Azure Metric alert for  metric - UsedCapacity
resource "azurerm_monitor_metric_alert" "metriclaert02" {
  depends_on          = [azurerm_storage_account.storage ]
  name                = "alert02"
  resource_group_name = var.storage_account_resource_group_name
  scopes              = [azurerm_storage_account.storage.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.storage_account_azurerm_monitor_metriclaert02
  criteria {
    metric_namespace  = "Microsoft.Storage/storageAccounts"
    metric_name       = "UsedCapacity"
    aggregation       = "Average"
    operator          = var.storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator
    threshold         = var.storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold
  }
  
  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}

# Azure Metric alert for  metric - Transactions
resource "azurerm_monitor_metric_alert" "metriclaert03" {
  depends_on          = [azurerm_storage_account.storage ]
  name                =  "alert03"
  resource_group_name =  var.storage_account_resource_group_name
  scopes              =  [azurerm_storage_account.storage.id]
  window_size         =  "PT1H"
  frequency           =  "PT1H"
  enabled             =   var.storage_account_azurerm_monitor_metriclaert03

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Transactions"
    aggregation      = "Total"
    operator         = var.storage_account_azurerm_monitor_metric_alert_Transactions_operator
    threshold        = var.storage_account_azurerm_monitor_metric_alert_Transactions_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}