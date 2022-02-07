#--------------------------------------------------------------
# Resource Group for Azure Key Valut
#--------------------------------------------------------------
resource "azurerm_resource_group" "resource_group" {
    name                = var.key_vault_resource_group_name
    location            = var.key_vault_resource_group_location
    tags                = var.key_vault_resource_group_tags
}

#--------------------------------------------------------------
# Azure Key Vault
#--------------------------------------------------------------
resource "azurerm_key_vault" "vault" {
  depends_on                  = [azurerm_resource_group.resource_group]
  name                        = var.key_vault_name
  location                    = var.key_vault_resource_group_location
  resource_group_name         = var.key_vault_resource_group_name
  tenant_id                   = var.key_vault_key_vault_tenant_id
  sku_name                    = var.key_vault_sku_name
  enabled_for_disk_encryption = var.key_vault_enabled_for_disk_encryption
  tags                        = var.key_vault_resource_group_tags
}

#--------------------------------------------------------------
#  Action Group
#--------------------------------------------------------------

resource "azurerm_monitor_action_group" "actiongroup" {
  depends_on          = [azurerm_resource_group.resource_group]
  name                = var.key_vault_monitor_action_group_name
  resource_group_name = var.key_vault_resource_group_name
  short_name          = var.key_vault_monitor_action_group_name_short_name

  dynamic "email_receiver" {
   for_each = local.emailid
   content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.emailid
    }
  }
}

#--------------------------------------------------------------
# DIAGNOSTIC SETTING
#--------------------------------------------------------------

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  depends_on                  = [azurerm_key_vault.vault]
  name                        = var.key_vault_monitor_diagnostic_setting_key_vault_name
  target_resource_id          = azurerm_key_vault.vault.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_workspace_id
  storage_account_id          = var.azurerm_storage_account_diagstorage_id
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

#--------------------------------------------------------------
#  METRIC ALERT for Availability
#-------------------------------------------------------------- 

resource "azurerm_monitor_metric_alert" "metriclaert01" {
  depends_on          = [azurerm_key_vault.vault]
  name                = "alert01"
  resource_group_name = var.key_vault_resource_group_name
  scopes              = [azurerm_key_vault.vault.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.key_vault_name_azurerm_monitor_metriclaert01
  
  criteria {
    metric_namespace = "Microsoft.KeyVault/vaults"
    metric_name      = "Availability"
    aggregation      = "Average"
    operator         =  var.key_vault_name_azurerm_monitor_metric_alert_active_connections_operator
    threshold        =  var.key_vault_name_azurerm_monitor_metric_alert_active_connections_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}



