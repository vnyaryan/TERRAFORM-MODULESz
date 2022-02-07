variable "container_registry_resource_group_name" {
  type        = string
  description = "name of Resource Group"
}

variable "container_registry_resource_group_location" {
  type        = string
  description = "location of Resource Group"
}

variable "container_registry_resource_group_tags" {
  type        = map
  description = "tags for resource Group"
}

variable "container_registry_monitor_action_group_name" {
  type        = string
  description = "action group  for acr"
}

variable "container_registry_monitor_action_group_name_short_name" {
  type        = string
  description = "short name for action group"
}

variable "container_registry_monitor_action_group_email_receiver_name" {
  type        = list
  description = "email reciver name of  action group"
}

variable "container_registry_monitor_action_group_email_receiver_email_address" {
  type        = list
  description = "email address for action group"
}

locals {
  emailid = [{
     name    =  var.container_registry_monitor_action_group_email_receiver_name[0] 
     emailid = var.container_registry_monitor_action_group_email_receiver_email_address[0]  
 },
 {
     name    =  var.container_registry_monitor_action_group_email_receiver_name[1] 
     emailid = var.container_registry_monitor_action_group_email_receiver_email_address[1]
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

variable "container_registry_name" {
  type        = string
  description = "acr name"
}

variable "container_registry_sku" {
  type        = string
  description = "acr sku"
}

variable "container_registry_admin_enabled" {
  type        = string
  description = "acr admin enabled"
}

variable "container_registry_zone_redundancy_enabled" {
  type        = string
  description = "acr zone redundancy enabled"
}

variable "container_registry_public_network_access_enabled" {
  type        = string
  description = "acr public network access enabled"
}

variable "container_registry_monitor_diagnostic_setting_acr_name" {
  type        = string
  description = "diagnostic setting name"
}

variable "container_registry_monitor_diagnostic_setting_metric_AllMetrics_status" {
  type        = string
  description = "metric status for AllMetric in Diagnostic setting"
}

variable "container_registry_monitor_diagnostic_setting_metric_AllMetrics_days" {
  type        = string
  description = "Total number of days for metric retention for AllMetric in Diagnostic setting"
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_status" {
  type        = string
  description = "Log status in Diagnostic setting"
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_days" {
  type        = string
  description = "Total number of  days for log retention in Diagnostic setting "
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_status" {
  type        = string
  description = "Log status in Diagnostic setting"
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_days" {
  type        = string
  description = "Total number of  days for log retention in Diagnostic setting"
}

variable "container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_operator" {
  type        = string
  description =  "Azure Metric Alert Operator details"
}

variable "container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_threshold" {
  type        = string
  description =  "Azure Metric Alert threshold"
}

variable "container_registry_azurerm_monitor_metric_alert_RunDuration_operator" {
  type        = string
  description =  "Azure Metric Alert Operator details "
}

variable "container_registry_azurerm_monitor_metric_alert_RunDuration_threshold" {
  type        = string
  description =  "Azure Metric Alert threshold"
}

variable "container_registry_azurerm_monitor_metriclaert01" {
  type    = string
  default = "false"
}

variable "container_registry_azurerm_monitor_metriclaert02" {
  type    = string
  default = "false"
}