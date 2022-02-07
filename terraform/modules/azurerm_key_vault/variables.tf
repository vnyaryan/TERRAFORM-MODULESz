#--------------------------------------------------------------
# Resource Group
#--------------------------------------------------------------

variable "key_vault_resource_group_location" {
    type        = string
    description = "location of Resource Group"
}

variable "key_vault_resource_group_name" {
    type        = string
    description = "name of Resource Group"
}

variable "key_vault_resource_group_tags" {
    type        = map
    description = "tags for  Resource Group"
}

#--------------------------------------------------------------
# keyvault
#--------------------------------------------------------------

variable "key_vault_name" {
    type        = string
    description = "name of Key vault"
}

variable "key_vault_key_vault_tenant_id" {
    type        = string
    description = "name of Key vault id"
}

variable "key_vault_sku_name" {
    type        = string
    description = "Type of Key vault SKU"
}


variable "key_vault_enabled_for_disk_encryption" {
    type        = string
    description = "Key vault encryption type"
}


variable "key_vault_name_azurerm_monitor_metriclaert01" {
    type     = string
    default  = "false"
}


#--------------------------------------------------------------
#  Action Group
#--------------------------------------------------------------

variable "key_vault_monitor_action_group_name" {
    type        = string
    description = "action group  for Key vault"
}

variable "key_vault_monitor_action_group_name_short_name" {
    type         = string
    description  = "short name for action group"
}

variable "key_vault_monitor_action_group_email_receiver_name" {
    type        = list
    description = "email reciver name of  action group"
}

variable "key_vault_monitor_action_group_email_receiver_email_address" {
    type        = list
    description = "email address for action group"
}

variable "key_vault_name_azurerm_monitor_metric_alert_active_connections_operator" {
    type        = string
    description = "metric alert operator "
}

variable "key_vault_name_azurerm_monitor_metric_alert_active_connections_threshold" {
    type        = string
    description = "metric alert threshold"
}

locals {
   emailid = [{
     name =  var.key_vault_monitor_action_group_email_receiver_name[0] 
     emailid = var.key_vault_monitor_action_group_email_receiver_email_address[0]
    
 },
 {
     name =  var.key_vault_monitor_action_group_email_receiver_name[1] 
     emailid = var.key_vault_monitor_action_group_email_receiver_email_address[1]
   
 }]

}
#--------------------------------------------------------------
#  DIAGNOSTIC SETTING
#--------------------------------------------------------------

variable "key_vault_monitor_diagnostic_setting_key_vault_name" {
    type         = string
    description  = "diagnostic setting name"
}

variable "azurerm_log_analytics_workspace_workspace_id" {
    type        = string
    description = "log analytics workspace"
    
}

variable "azurerm_storage_account_diagstorage_id" {
    type        = string
    description = "diagnostic storage account"
}

