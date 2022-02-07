
variable "virtual_network_resource_group_name" {
      type         = string
      description  = "name of Resource Group"
}

variable "virtual_network_resource_group_location" {
   type        = string
   description = "location of Resource Group"
}

variable "virtual_network_resource_group_tags" {
    type        = map
    description = "tags for resource Group"
}

variable "virtual_network_name" {
    type = string
     
}
variable "virtual_network_address_space" {
    type = list
}


variable "virtual_network_monitor_action_group_name" {
    type        = string
    description = "action group"
}

variable "virtual_network_monitor_action_group_name_short_name" {
    type         = string
    description  = "short name for action group"
}

variable "virtual_network_monitor_action_group_email_receiver_name" {
    type        = list
    description = "email reciver name of  action group"
}

variable "virtual_network_monitor_action_group_email_receiver_email_address" {
    type        = list
    description = "email address for action group"
}

variable "azurerm_log_analytics_workspace_workspace_id" {
    type        = string
    description = "log analytics workspace"
}

variable "azurerm_storage_account_diagstorage_id" {
    type        = string
    description = "diagnostic storage account id"
}

variable "virtual_network_monitor_diagnostic_setting_vnet_name" {
    type        = string
    description = "diagnostic setting name"
}

variable "virtual_network_monitor_diagnostic_setting_metric_AllMetrics_status" {
    type        =  string
    description = "metric status for AllMetric in Diagnostic setting"
}

variable "virtual_network_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type        = string
    description = "Total number of days for metric retention for AllMetric in Diagnostic setting"
}

variable "virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_status" {
    type = string
}

variable "virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_days" {
    type = string
}


variable "virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_operator" {
    type = string
}

variable "virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_threshold" {
    type = string
}

variable "virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_operator" {
    type = string
}

variable "virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_threshold" {
    type = string
}


locals {
   emailid = [{
     name    =  var.virtual_network_monitor_action_group_email_receiver_name[0] 
     emailid = var.virtual_network_monitor_action_group_email_receiver_email_address[0]
    
 },
 {
     name    =  var.virtual_network_monitor_action_group_email_receiver_name[1] 
     emailid = var.virtual_network_monitor_action_group_email_receiver_email_address[1]
   
 }]

}

variable "virtual_network_azurerm_monitor_metric_metriclaert1" {
    type    = string
    default = "false"
}

variable "virtual_network_azurerm_monitor_metric_metriclaert2" {
    type   = string
    default = "false"
}
