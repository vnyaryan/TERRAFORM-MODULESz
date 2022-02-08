# Resource Group for Azure Container Registry
resource "azurerm_resource_group" "resource_group" {
    name                = var.container_registry_resource_group_name
    location            = var.container_registry_resource_group_location
    tags                = var.container_registry_resource_group_tags
}

# ACR  
resource "azurerm_container_registry" "acr" {
  depends_on                     = [azurerm_resource_group.resource_group]
  name                           = var.container_registry_name
  resource_group_name            = var.container_registry_resource_group_name
  location                       = var.container_registry_resource_group_location
  sku                            = var.container_registry_sku
  admin_enabled                  = var.container_registry_admin_enabled
  zone_redundancy_enabled        = var.container_registry_zone_redundancy_enabled
  public_network_access_enabled  = var.container_registry_public_network_access_enabled
  tags                           = var.container_registry_resource_group_tags
}

# Azure Action Group for all metric
resource "azurerm_monitor_action_group" "actiongroup" {
  depends_on             = [azurerm_resource_group.resource_group]
  name                   = var.container_registry_monitor_action_group_name
  resource_group_name    = var.container_registry_resource_group_name
  short_name             = var.container_registry_monitor_action_group_name_short_name

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
  depends_on                  = [azurerm_container_registry.acr]
  name                        = var.container_registry_monitor_diagnostic_setting_acr_name
  target_resource_id          = azurerm_container_registry.acr.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_workspace_id
  storage_account_id          = var.azurerm_storage_account_diagstorage_id
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled  = var.container_registry_monitor_diagnostic_setting_metric_AllMetrics_status
      days     = var.container_registry_monitor_diagnostic_setting_metric_AllMetrics_days
    }
  }

  log {
    category = "ContainerRegistryLoginEvents"
    enabled  = true

    retention_policy {
      enabled   = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_status
      days      = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_days
    }
  }
  log {
    category = "ContainerRegistryRepositoryEvents"
    enabled  = true

    retention_policy {
       enabled = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_status
          days = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_days
    }
  }
}

# Azure Metric alert for  metric - AgentPoolCPUTime
resource "azurerm_monitor_metric_alert" "metriclaert01" {
  depends_on          = [azurerm_container_registry.acr]
  name                =  "alert01"
  resource_group_name =  var.container_registry_resource_group_name
  scopes              =   [azurerm_container_registry.acr.id]
  window_size         =  "PT1H"
  frequency           =  "PT1H"
  enabled             =   var.container_registry_azurerm_monitor_metriclaert01
  criteria {
    metric_namespace = "Microsoft.ContainerRegistry/registries"
    metric_name      = "AgentPoolCPUTime"
    aggregation      = "Total"
    operator         = var.container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_operator
    threshold        = var.container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}

# Azure Metric alert for  metric - RunDuration
resource "azurerm_monitor_metric_alert" "metriclaert02" {
  depends_on          = [azurerm_container_registry.acr]
  name                =   "alert02"
  resource_group_name =  var.container_registry_resource_group_name
  scopes              =   [azurerm_container_registry.acr.id]
  window_size         =  "PT1H"
  frequency           =  "PT1H"
  enabled             =   var.container_registry_azurerm_monitor_metriclaert02
  criteria {
    metric_namespace = "Microsoft.ContainerRegistry/registries"
    metric_name      = "RunDuration"
    aggregation      = "Total"
    operator         =  var.container_registry_azurerm_monitor_metric_alert_RunDuration_operator
    threshold        =  var.container_registry_azurerm_monitor_metric_alert_RunDuration_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}



