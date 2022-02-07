variable "postgresql_server_resource_group_name" {
      type        = string
      description = "name of Resource Group"
}

variable "postgresql_server_resource_group_location" {
   type        = string
   description = "location of Resource Group"
}

variable "postgresql_server_resource_group_tags" {
    type        = map
    description = "tags for resource Group"
}

variable "postgresql_server_monitor_action_group_name" {
    type        = string
    description = "action group  for postgresql"
}

variable "postgresql_server_monitor_action_group_name_short_name" {
    type        = string
    description = "short name for action group"
}
variable "postgresql_server_monitor_action_group_email_receiver_name" {
    type        = list
    description = "email reciver name of  action group"
}
variable "postgresql_server_monitor_action_group_email_receiver_email_address" {
    type        = list
    description = "email address for action group"
}

locals {
   emailid = [{
     name =  var.postgresql_server_monitor_action_group_email_receiver_name[0] 
     emailid = var.postgresql_server_monitor_action_group_email_receiver_email_address[0]
    
 },
 {
     name =  var.postgresql_server_monitor_action_group_email_receiver_name[1] 
     emailid = var.postgresql_server_monitor_action_group_email_receiver_email_address[1]
   
 }]

}
variable "azurerm_log_analytics_workspace_workspace_id" {
    type        = string
    description = "log analytics workspace"
}

variable "azurerm_storage_account_diagstorage_id" {
    type        = string
    description = "diagnostic storage account id"
}

variable "postgresql_server_name" {
    type = string
}

variable "postgresql_server_username" {
    type = string
}

variable "postgresql_server_password" {
    type = string
}

variable "postgresql_server_sku" {
    type = string
}

variable "postgresql_server_version" {
    type = string
}

variable "postgresql_server_storage_mb" {
    type = string
}

variable "postgresql_server_backup_retention_days" {
    type = string
}

variable "postgresql_server_geo_redundant_backup_enabled" {
    type = string
}

variable "postgresql_server_monitor_diagnostic_setting_postgresql_server_name" {
    type         = string
     description = "diagnostic setting name"
}

variable "postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_status" {
    type        = string
    description = "metric status for AllMetric in Diagnostic setting"
}

variable "postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type         = string
    description = "Total number of days for metric retention for AllMetric in Diagnostic setting"
}

variable "postgresql_server_azurerm_monitor_metric_alert_active_connections_operator" {
    type        = string
    description =  "Azure Metric Alert Operator details"
}

variable "postgresql_server_azurerm_monitor_metric_alert_active_connections_threshold" {
    type          = string
    description   =  "Azure Metric Alert threshold"
}

variable "postgresql_server_azurerm_monitor_metric_alert_connections_failed_operator" {
    type        = string
    description =  "Azure Metric Alert Operator details"
}

variable "postgresql_server_azurerm_monitor_metric_alert_connections_failed_threshold" {
    type         =  string
     description =  "Azure Metric Alert threshold"
}

variable "postgresql_server_azurerm_monitor_metric_alert_storage_used_operator" {
    type        = string
    description =  "Azure Metric Alert Operator details"
}

variable "postgresql_server_azurerm_monitor_metric_alert_storage_used_threshold" {
    type          =  string
     description  =  "Azure Metric Alert threshold"
}

variable "postgresql_server_azurerm_monitor_metriclaert01" {
    type     = string
    default  = "false"
}

variable "postgresql_server_azurerm_monitor_metriclaert02" {
    type     = string
     default = "false"
}

variable "postgresql_server_azurerm_monitor_metriclaert03" {
    type     =  string
     default = "false"
}


