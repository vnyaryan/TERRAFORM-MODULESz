
#--------------------------------------------------------------
#  STORAGE ACCOUNT
#--------------------------------------------------------------

variable "storage_account_resource_group_name" {
      type = string
}


variable "storage_account_resource_group_location" {
   type = string
}

variable "storage_account_resource_group_tags" {
    type = map
}

variable "storage_account_monitor_action_group_name" {
    type = string
}



variable "storage_account_monitor_action_group_name_short_name" {
    type = string
}

variable "storage_account_monitor_action_group_email_receiver_name" {
    type = list
}

variable "storage_account_monitor_action_group_email_receiver_email_address" {
    type = list
}

variable "storage_account_name" {
    type = string
}




variable "storage_account_tier" {
    type = string
}

variable "storage_account_tier_replication_type" {
    type = string
}

variable "storage_account_access_tier" {
    type = string
}

variable "storage_account_min_tls_version" {
    type = string
}

variable "storage_account_monitor_diagnostic_setting_storage_name" {
    type = string
}


variable "storage_account_monitor_diagnostic_setting_storage_metric_Transaction_status" {
    type = string
}

variable "storage_account_monitor_diagnostic_setting_storage_metric_Transaction_days" {
    type = string
}

variable "storage_account_azurerm_monitor_metric_alert_Availability_operator" {
    type = string
}


variable "storage_account_azurerm_monitor_metric_alert_Availability_threshold" {
    type = string
}

variable "storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator" {
    type = string
}

variable "storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold" {
    type = string
}

variable "storage_account_azurerm_monitor_metric_alert_Transactions_operator" {
    type = string
}

variable "storage_account_azurerm_monitor_metric_alert_Transactions_threshold" {
    type = string
}

variable "storage_account_azurerm_monitor_metriclaert01" {
    type = string
    
}

variable "storage_account_azurerm_monitor_metriclaert02" {
    type = string
    
}

variable "storage_account_azurerm_monitor_metriclaert03" {
    type = string
    
}

variable "azurerm_storage_account_diagstorage_status" {
    type    = bool
    default = "true"
}


/*
#--------------------------------------------------------------
#  ACR
#--------------------------------------------------------------

variable "container_registry_resource_group_name" {
      type = string
}

variable "container_registry_resource_group_location" {
   type = string
}

variable "container_registry_resource_group_tags" {
    type = map
}


variable "container_registry_monitor_action_group_name" {
    type = string
}

variable "container_registry_monitor_action_group_name_short_name" {
    type = string
}

variable "container_registry_monitor_action_group_email_receiver_name" {
    type = list
}

variable "container_registry_monitor_action_group_email_receiver_email_address" {
    type = list
}

variable "kubernetes_cluster_node_pool_name" {
   type = string
}

variable "kubernetes_cluster_node_pool_type" {
   type = string
}

variable "container_registry_name" {
    type = string
}

variable "container_registry_sku" {
    type = string
}

variable "container_registry_admin_enabled" {
    type = string
}

variable "container_registry_zone_redundancy_enabled" {
    type = string
}

variable "container_registry_public_network_access_enabled" {
  type = string
}

variable "container_registry_monitor_diagnostic_setting_acr_name" {
    type = string
}

variable "container_registry_monitor_diagnostic_setting_metric_AllMetrics_status" {
    type = string
}

variable "container_registry_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type = string
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_status" {
    type = string
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_days" {
    type = string
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_status" {
    type = string
}

variable "container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_days" {
    type = string
}

variable "container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_operator" {
    type = string
}

variable "container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_threshold" {
    type = string
}

variable "container_registry_azurerm_monitor_metric_alert_RunDuration_operator" {
    type = string
}

variable "container_registry_azurerm_monitor_metric_alert_RunDuration_threshold" {
    type = string
}

variable "container_registry_azurerm_monitor_metriclaert01" {
    type = string
   
}

variable "container_registry_azurerm_monitor_metriclaert02" {
    type = string
    
}
*/
#--------------------------------------------------------------
# VNET
#--------------------------------------------------------------

variable "virtual_network_resource_group_name" {
      type = string
}

variable "virtual_network_resource_group_location" {
   type = string
}

variable "virtual_network_resource_group_tags" {
    type = map
}

variable "virtual_network_name" {
    type = string
}

variable "virtual_network_address_space" {
    type = list
}

variable "virtual_network_monitor_action_group_name" {
    type = string
}

variable "virtual_network_monitor_action_group_name_short_name" {
    type = string
}

variable "virtual_network_monitor_action_group_email_receiver_name" {
    type = list
}

variable "virtual_network_monitor_action_group_email_receiver_email_address" {
    type = list
}

variable "virtual_network_monitor_diagnostic_setting_vnet_name" {
    type = string
}

variable "virtual_network_monitor_diagnostic_setting_metric_AllMetrics_status" {
    type = string
}

variable "virtual_network_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type = string
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

variable "virtual_network_azurerm_monitor_metric_metriclaert1" {
    type = string
}

variable "virtual_network_azurerm_monitor_metric_metriclaert2" {
    type = string
}


#--------------------------------------------------------------
# SUBNET
#--------------------------------------------------------------

variable "subnet_name" {
    type = string
}

variable "subnet_address_prefixes" {
    type = list
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
    type = bool
}




  /*
#--------------------------------------------------------------
# POSTGRESQL DB
#--------------------------------------------------------------
variable "postgresql_server_resource_group_name" {
      type = string
}

variable "postgresql_server_resource_group_location" {
   type = string
}

variable "postgresql_server_resource_group_tags" {
    type = map
}

variable "postgresql_server_monitor_action_group_name" {
    type = string
}

variable "postgresql_server_monitor_action_group_name_short_name" {
    type = string
}

variable "postgresql_server_monitor_action_group_email_receiver_name" {
    type = list
}

variable "postgresql_server_monitor_action_group_email_receiver_email_address" {
    type = list

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
    type = string
}

variable "postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_status" {
    type = string
}

variable "postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metric_alert_active_connections_operator" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metric_alert_active_connections_threshold" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metric_alert_connections_failed_operator" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metric_alert_connections_failed_threshold" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metric_alert_storage_used_operator" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metric_alert_storage_used_threshold" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metriclaert01" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metriclaert02" {
    type = string
}

variable "postgresql_server_azurerm_monitor_metriclaert03" {
    type = string
}



#--------------------------------------------------------------
# AKS
#--------------------------------------------------------------

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
    type        = string
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
     type        = string
     description = "metric status for AllMetric in Diagnostic setting"
}

variable "kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_days" {
    type        = string
    description = "Total number of days for metric retention for AllMetric in Diagnostic setting"
}


variable "kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_status" {
    type         = string
    description  = "Log status in Diagnostic setting"
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
    type        = string
    description = "Total number of  days for log retention in Diagnostic setting"
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
    type        = string
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
    type = string
    
}

variable "kubernetes_cluster_azurerm_monitor_metriclaert02" {
    type = string
    
}


#--------------------------------------------------------------
# AKV
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

variable "key_vault_name" {
    type        = string
    description = "name of Key vault"
}

variable "key_vault_sku_name" {
    type        = string
    description = "Type of Key vault SKU"
}

variable "key_vault_enabled_for_disk_encryption" {
    type          = string
    description   = "Key vault encryption type"
}

variable "key_vault_monitor_diagnostic_setting_key_vault_name" {
     type        = string
     description = "Key vault encryption type"
}

variable "key_vault_monitor_action_group_name" {
    type       = string
   description = "action-group-name"
}

variable "key_vault_monitor_action_group_name_short_name" {
    type        = string
    description = "action-group-name short name"
}

variable "key_vault_monitor_action_group_email_receiver_name" {
    type       = list
   description = "action group email receiver name"
}

variable "key_vault_monitor_action_group_email_receiver_email_address" {
    type        = list
    description = "action group email  address details"
}
               
variable "key_vault_name_azurerm_monitor_metric_alert_active_connections_operator" {
    type        = string
    description = "metric alert operator"
}

variable "key_vault_name_azurerm_monitor_metric_alert_active_connections_threshold" {
    type = string
      
}

variable "key_vault_name_azurerm_monitor_metriclaert01" {
    type = string
    
}
*/
#--------------------------------------------------------------
# DIAGNOSTIC STORAGE ACCOUNT  AND LOG ANALYTICS WORKSPACE
#--------------------------------------------------------------

 variable "diag_storage_account_resource_group_name" {
      type = string
}


variable "diag_storage_account_resource_group_location" {
   type = string
}

variable "diag_storage_account_resource_group_tags" {
    type = map
}

variable "diag_storage_account_monitor_action_group_name" {
    type = string
}



variable "diag_storage_account_monitor_action_group_name_short_name" {
    type = string
}

variable "diag_storage_account_monitor_action_group_email_receiver_name" {
    type = list
}

variable "diag_storage_account_monitor_action_group_email_receiver_email_address" {
    type = list
}

variable "diag_storage_account_name" {
    type = string
}




variable "diag_storage_account_tier" {
    type = string
}

variable "diag_storage_account_tier_replication_type" {
    type = string
}

variable "diag_storage_account_access_tier" {
    type = string
}

variable "diag_storage_account_min_tls_version" {
    type = string
}

variable "diag_storage_account_monitor_diagnostic_setting_storage_name" {
    type = string
	default = "false"
}


variable "diag_storage_account_monitor_diagnostic_setting_storage_metric_Transaction_status" {
    type = string
	default = "false"
}

variable "diag_storage_account_monitor_diagnostic_setting_storage_metric_Transaction_days" {
    type = string
	default = "false"
}

variable "diag_storage_account_azurerm_monitor_metric_alert_Availability_operator" {
    type = string
}


variable "diag_storage_account_azurerm_monitor_metric_alert_Availability_threshold" {
    type = string
}

variable "diag_storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator" {
    type = string
}

variable "diag_storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold" {
    type = string
}

variable "diag_storage_account_azurerm_monitor_metric_alert_Transactions_operator" {
    type = string
}

variable "diag_storage_account_azurerm_monitor_metric_alert_Transactions_threshold" {
    type = string
}

variable "diag_storage_account_azurerm_monitor_metriclaert01" {
    type = string
    
}

variable "diag_storage_account_azurerm_monitor_metriclaert02" {
    type = string
    
}

variable "diag_storage_account_azurerm_monitor_metriclaert03" {
    type = string
    
}

variable "diag_azurerm_storage_account_diagstorage_status" {
    type    = bool
    default = "false"
}
#--------------------------------------------------------------
#  LOG ANALYTICS WORKSPACE
#--------------------------------------------------------------

variable "log_analytics_workspace_name" {
    type = string
    
}

variable "log_analytics_workspace_sku" {
    type = string
   
}

 #--------------------------------------------------------------
#  AUTHENTICATION
#--------------------------------------------------------------
 
 variable "azurerm_client_id" {
    type = string
   
}

variable "azurerm_client_secret" {
    type = string
   
}

 variable "azurerm_tenant_id" {
    type = string
   
}

 variable "azurerm_subscription_id" {
    type = string
   
}

