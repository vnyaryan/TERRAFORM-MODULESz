# Resource Group for PostGreSQL
resource "azurerm_resource_group" "resource_group" {
  name                = var.postgresql_server_resource_group_name
  location            = var.postgresql_server_resource_group_location
  tags                = var.postgresql_server_resource_group_tags
}

#PostGreSQL Server
resource "azurerm_postgresql_flexible_server" "postgresql_server" {

  depends_on                    = [azurerm_resource_group.resource_group]
  name                          = var.postgresql_server_name
  location                      = var.postgresql_server_resource_group_location
  resource_group_name           = var.postgresql_server_resource_group_name

  administrator_login           = var.postgresql_server_username
  administrator_password        = var.postgresql_server_password

  sku_name                      = var.postgresql_server_sku
  version                       = var.postgresql_server_version
  storage_mb                    = var.postgresql_server_storage_mb

  backup_retention_days         = var.postgresql_server_backup_retention_days
  geo_redundant_backup_enabled  = var.postgresql_server_geo_redundant_backup_enabled  
  tags                          = var.postgresql_server_resource_group_tags
}

# Azure Action Group for all metric
resource "azurerm_monitor_action_group" "actiongroup" {
  depends_on          = [azurerm_resource_group.resource_group]
  name                = var.postgresql_server_monitor_action_group_name
  resource_group_name = var.postgresql_server_resource_group_name
  short_name          = var.postgresql_server_monitor_action_group_name_short_name

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
  depends_on                  = [azurerm_postgresql_flexible_server.postgresql_server]
  name                        = var.postgresql_server_monitor_diagnostic_setting_postgresql_server_name
  target_resource_id          = azurerm_postgresql_flexible_server.postgresql_server.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_workspace_id
  storage_account_id          = var.azurerm_storage_account_diagstorage_id
  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = var.postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_status
      days    = var.postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_days
    }
  }
}

# Azure Metric alert for  metric - number of active_connections
resource "azurerm_monitor_metric_alert" "metriclaert01" {
  depends_on          = [azurerm_postgresql_flexible_server.postgresql_server]
  name                = "alert01"
  resource_group_name = var.postgresql_server_resource_group_name
  scopes              = [azurerm_postgresql_flexible_server.postgresql_server.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.postgresql_server_azurerm_monitor_metriclaert01

  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "active_connections"
    aggregation      = "Average"
    operator         =  var.postgresql_server_azurerm_monitor_metric_alert_active_connections_operator
    threshold        =  var.postgresql_server_azurerm_monitor_metric_alert_active_connections_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}

# Azure Metric alert for  metric - number of failed connections
resource "azurerm_monitor_metric_alert" "metriclaert02" {
  depends_on          = [azurerm_postgresql_flexible_server.postgresql_server]
  name                =   "alert02"
  resource_group_name =   var.postgresql_server_resource_group_name
  scopes              =   [azurerm_postgresql_flexible_server.postgresql_server.id]
  window_size         =  "PT1H"
  frequency           =  "PT1H"
  enabled             =   var.postgresql_server_azurerm_monitor_metriclaert02

  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "connections_failed"
    aggregation      = "Total"
    operator         =  var.postgresql_server_azurerm_monitor_metric_alert_connections_failed_operator
    threshold        =  var.postgresql_server_azurerm_monitor_metric_alert_connections_failed_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}
                 
# Azure Metric alert for  metric - storage_used				 
resource "azurerm_monitor_metric_alert" "metriclaert03" {
  depends_on          = [azurerm_postgresql_flexible_server.postgresql_server]
  name                = "alert03"
  resource_group_name = var.postgresql_server_resource_group_name
  scopes              = [azurerm_postgresql_flexible_server.postgresql_server.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.postgresql_server_azurerm_monitor_metriclaert03
  criteria {
    metric_namespace  = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name       = "storage_used"
    aggregation       = "Average"
    operator          =  var.postgresql_server_azurerm_monitor_metric_alert_storage_used_operator
    threshold         =  var.postgresql_server_azurerm_monitor_metric_alert_storage_used_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}                 

