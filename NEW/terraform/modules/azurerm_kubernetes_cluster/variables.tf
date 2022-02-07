variable "kubernetes_cluster_resource_group_name" {
      type        = string
      description = "name of Resource Group"
}

variable "kubernetes_cluster_resource_group_location" {
    type        = string
    description = "location of Resource Group"
}

variable "kubernetes_cluster_resource_group_tags" {
     type        = map
     description = "tags for resource Group"
}

variable "kubernetes_cluster_monitor_action_group_name" {
    type        = string
    description = "action group  for acr"
}

variable "kubernetes_cluster_monitor_action_group_name_short_name" {
    type       = string
    description = "short name for action group"
}

variable "kubernetes_cluster_monitor_action_group_email_receiver_name" {
    type        = list
    description = "email reciver name of  action group"
}

variable "kubernetes_cluster_monitor_action_group_email_receiver_email_address" {
    type        = list
    description = "email address for action group"
}

variable "kubernetes_cluster_vnet_subnet_id" {
   type = string
}

variable "kubernetes_cluster_node_pool_name" {
   type = string
}

variable "kubernetes_cluster_node_pool_type" {
   type = string
}

locals {
   emailid = [{
     name =  var.kubernetes_cluster_monitor_action_group_email_receiver_name[0] 
     emailid = var.kubernetes_cluster_monitor_action_group_email_receiver_email_address[0]
    
 },
 {
     name =  var.kubernetes_cluster_monitor_action_group_email_receiver_name[1] 
     emailid = var.kubernetes_cluster_monitor_action_group_email_receiver_email_address[1]
   
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

variable "kubernetes_cluster_name" {
    type = string
}

variable "kubernetes_cluster_dns_prefix" {
   type = string
}

variable "kubernetes_cluster_node_resource_group" {
   type = string
}

variable "kubernetes_cluster_vm_size" {
   type = string
}

variable "kubernetes_cluster_os_disk_size_gb" {
   type = string
}

variable "kubernetes_cluster_availability_zones" {
   type = list
}

variable "kubernetes_cluster_auto_scaling" {
   type = string
}

variable "kubernetes_cluster_min_count" {
   type = string
}
variable "kubernetes_cluster_max_count" {
   type = string
}

variable "kubernetes_cluster_monitor_diagnostic_setting_aks_name" {
    type        = string
    description = "diagnostic setting name"
}

variable "kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_status" {
    type          = string
     description  = "metric status for AllMetric in Diagnostic setting"
}

variable "kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type        = string
    description = "Total number of days for metric retention for AllMetric in Diagnostic setting"
}

variable "kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_status" {
    type        = string
    description = "Log status in Diagnostic setting"
}

variable "kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_days" {
    type        = string
    description = "Total number of  days for log retention in Diagnostic setting "
}

variable "kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_status" {
    type        = string
    description = "Log status in Diagnostic setting"
}

variable "kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_days" {
    type          = string
    description   = "Total number of  days for log retention in Diagnostic setting"
}

variable "kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_operator" {
    type        = string
    description =  "Azure Metric Alert Operator details"
}

variable "kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_threshold" {
    type        = string
    description =  "Azure Metric Alert threshold"
}

variable "kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_operator" {
    type        =  string
    description =  "Azure Metric Alert Operator details "
}

variable "kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_threshold" {
    type        = string
    description =  "Azure Metric Alert threshold"
}

variable "kubernetes_cluster_identity" {
    type        = string
    description =  "identity"
}

variable "kubernetes_cluster_azurerm_monitor_metriclaert01" {
    type    = string
    default = "false"
}

variable "kubernetes_cluster_azurerm_monitor_metriclaert02" {
    type    = string
    default = "false"
}

variable "azurerm_role_assignment_acr_id" {
    type    = string
    
}

variable "subnetstatus" {
    type    = string
     default = "true"
}
