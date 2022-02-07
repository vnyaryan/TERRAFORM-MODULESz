terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  } 
  backend "azurerm" {}
}


provider "azurerm" {
  
    
    client_id        =   var.azurerm_client_id
    client_secret    =   var.azurerm_client_secret
    tenant_id        =   var.azurerm_tenant_id
    subscription_id  =   var.azurerm_subscription_id
    features {}

}

  
   

#--------------------------------------------------------------
# DATA Sources for  current AzureRM provider
#--------------------------------------------------------------

data "azurerm_client_config" "current" {}

#---------------------------------------------------------------------------------------
# DIAGNOSTIC STORAGE ACCOUNT  AND LOG ANALYTICS WORKSPACE  
#---------------------------------------------------------------------------------------

module "diagstracc" {
source =  "./modules/azurerm_diag_storage_account"

diag_storage_account_resource_group_name      = var.diag_storage_account_resource_group_name 
diag_storage_account_resource_group_location  = var.diag_storage_account_resource_group_location
diag_storage_account_resource_group_tags      = var.diag_storage_account_resource_group_tags


diag_storage_account_name                   = var.diag_storage_account_name
diag_storage_account_tier                   = var.diag_storage_account_tier 
diag_storage_account_tier_replication_type  = var.diag_storage_account_tier_replication_type



}
#---------------------------------------------------------------------------------------
#  LOG ANALYTICS WORKSPACE 
#---------------------------------------------------------------------------------------

module "loganalytics" {
source =  "./modules/azurerm_log_analytics_workspace"
depends_on  = [module.diagstracc]
    log_analytics_workspace_name                = var.log_analytics_workspace_name
    log_analytics_workspace_location            = module.diagstracc.resource_group_location
    log_analytics_workspace_resource_group_name = module.diagstracc.resource_group_name
    log_analytics_workspace_sku                 = var.log_analytics_workspace_sku
    log_analytics_workspace_tags                = var.diag_storage_account_resource_group_tags
}


#--------------------------------------------------------------
# VNET
#--------------------------------------------------------------

module "vnet" {
source =  "./modules/azurerm_virtual_network"
depends_on  = [module.loganalytics]


virtual_network_resource_group_name     = var.virtual_network_resource_group_name
virtual_network_resource_group_location = var.virtual_network_resource_group_location
virtual_network_resource_group_tags     = var.virtual_network_resource_group_tags

virtual_network_name                   = var.virtual_network_name
virtual_network_address_space          = var.virtual_network_address_space
virtual_network_subnet_name            = var.virtual_network_subnet_name

virtual_network_subnet_address_prefixes                               = var.virtual_network_subnet_address_prefixes
virtual_network_subnet_enforce_private_link_endpoint_network_policies = var.virtual_network_subnet_enforce_private_link_endpoint_network_policies
virtual_network_monitor_action_group_name                             = var.virtual_network_monitor_action_group_name

virtual_network_monitor_action_group_name_short_name                   = var.virtual_network_monitor_action_group_name_short_name
virtual_network_monitor_action_group_email_receiver_name               = var.virtual_network_monitor_action_group_email_receiver_name
virtual_network_monitor_action_group_email_receiver_email_address      = var.virtual_network_monitor_action_group_email_receiver_email_address

virtual_network_monitor_diagnostic_setting_vnet_name                 = var.virtual_network_monitor_diagnostic_setting_vnet_name
virtual_network_monitor_diagnostic_setting_metric_AllMetrics_status  = var.virtual_network_monitor_diagnostic_setting_metric_AllMetrics_status
virtual_network_monitor_diagnostic_setting_metric_AllMetrics_days    = var.virtual_network_monitor_diagnostic_setting_metric_AllMetrics_days
azurerm_storage_account_diagstorage_id                               = module.diagstracc.storage_account_id
azurerm_log_analytics_workspace_workspace_id                         = module.loganalytics.loganalytics_id

virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_status  = var.virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_status
virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_days    = var.virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_days
virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_operator   = var.virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_operator
virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_threshold  = var.virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_threshold
virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_operator         = var.virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_operator
virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_threshold        = var.virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_threshold

virtual_network_azurerm_monitor_metric_metriclaert1 =  var.virtual_network_azurerm_monitor_metric_metriclaert1
virtual_network_azurerm_monitor_metric_metriclaert2 =  var.virtual_network_azurerm_monitor_metric_metriclaert2


}

#--------------------------------------------------------------
# POSTGRESQL 
#--------------------------------------------------------------


module "postgresql" {
source =  "./modules/azurerm_postgresql_server"
depends_on  = [module.vnet]

postgresql_server_resource_group_name                                               = var.postgresql_server_resource_group_name
postgresql_server_resource_group_location                                           = var.postgresql_server_resource_group_location
postgresql_server_resource_group_tags                                               = var.postgresql_server_resource_group_tags

postgresql_server_monitor_action_group_name                                         = var.postgresql_server_monitor_action_group_name
postgresql_server_monitor_action_group_name_short_name                              =  var.postgresql_server_monitor_action_group_name_short_name
postgresql_server_monitor_action_group_email_receiver_name                          = var.postgresql_server_monitor_action_group_email_receiver_name
postgresql_server_monitor_action_group_email_receiver_email_address                 = var.postgresql_server_monitor_action_group_email_receiver_email_address


postgresql_server_name                 = var.postgresql_server_name
postgresql_server_username             = var.postgresql_server_username
postgresql_server_password             = var.postgresql_server_password
postgresql_server_sku                  = var.postgresql_server_sku
postgresql_server_version              = var.postgresql_server_version
postgresql_server_storage_mb           = var.postgresql_server_storage_mb
postgresql_server_backup_retention_days               = var.postgresql_server_backup_retention_days
postgresql_server_geo_redundant_backup_enabled        = var.postgresql_server_geo_redundant_backup_enabled

azurerm_storage_account_diagstorage_id           =   module.diagstracc.storage_account_id
azurerm_log_analytics_workspace_workspace_id     =   module.loganalytics.loganalytics_id

postgresql_server_monitor_diagnostic_setting_postgresql_server_name                 = var.postgresql_server_monitor_diagnostic_setting_postgresql_server_name
postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_status               = var.postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_status
postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_days                 = var.postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_days

postgresql_server_azurerm_monitor_metric_alert_active_connections_operator          = var.postgresql_server_azurerm_monitor_metric_alert_active_connections_operator
postgresql_server_azurerm_monitor_metric_alert_active_connections_threshold         = var.postgresql_server_azurerm_monitor_metric_alert_active_connections_threshold

postgresql_server_azurerm_monitor_metric_alert_connections_failed_operator          = var.postgresql_server_azurerm_monitor_metric_alert_connections_failed_operator
postgresql_server_azurerm_monitor_metric_alert_connections_failed_threshold         = var.postgresql_server_azurerm_monitor_metric_alert_connections_failed_threshold

postgresql_server_azurerm_monitor_metric_alert_storage_used_operator     = var.postgresql_server_azurerm_monitor_metric_alert_storage_used_operator
postgresql_server_azurerm_monitor_metric_alert_storage_used_threshold     = var.postgresql_server_azurerm_monitor_metric_alert_storage_used_threshold

postgresql_server_azurerm_monitor_metriclaert01  = var.postgresql_server_azurerm_monitor_metriclaert01 
postgresql_server_azurerm_monitor_metriclaert02  = var.postgresql_server_azurerm_monitor_metriclaert02
postgresql_server_azurerm_monitor_metriclaert03  = var.postgresql_server_azurerm_monitor_metriclaert03



}

#--------------------------------------------------------------
# STORAGE ACCOUNT 
#--------------------------------------------------------------

module "storageaccount" {
source =  "./modules/azurerm_storage_account"
depends_on  =  [module.postgresql]

 storage_account_resource_group_name         = var.storage_account_resource_group_name
 storage_account_resource_group_location     = var.storage_account_resource_group_location
 storage_account_resource_group_tags         = var.storage_account_resource_group_tags

 storage_account_monitor_action_group_name                         = var.storage_account_monitor_action_group_name
 storage_account_monitor_action_group_name_short_name              = var.storage_account_monitor_action_group_name_short_name
 storage_account_monitor_action_group_email_receiver_name          = var.storage_account_monitor_action_group_email_receiver_name
 storage_account_monitor_action_group_email_receiver_email_address = var.storage_account_monitor_action_group_email_receiver_email_address


 storage_account_name                  = var.storage_account_name
 storage_account_tier                  = var.storage_account_tier
 storage_account_tier_replication_type = var.storage_account_tier_replication_type
 storage_account_access_tier           = var.storage_account_access_tier
 storage_account_min_tls_version       = var.storage_account_min_tls_version

 azurerm_storage_account_diagstorage_id           =   module.diagstracc.storage_account_id
 azurerm_log_analytics_workspace_workspace_id     =   module.loganalytics.loganalytics_id

 storage_account_monitor_diagnostic_setting_storage_name                        = var.storage_account_monitor_diagnostic_setting_storage_name
 storage_account_monitor_diagnostic_setting_storage_metric_Transaction_status   = var.storage_account_monitor_diagnostic_setting_storage_metric_Transaction_status
 storage_account_monitor_diagnostic_setting_storage_metric_Transaction_days     = var.storage_account_monitor_diagnostic_setting_storage_metric_Transaction_days
 storage_account_azurerm_monitor_metric_alert_Availability_operator             = var.storage_account_azurerm_monitor_metric_alert_Availability_operator
 storage_account_azurerm_monitor_metric_alert_Availability_threshold            = var.storage_account_azurerm_monitor_metric_alert_Availability_threshold
 storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator             = var.storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator
 storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold            = var.storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold
 storage_account_azurerm_monitor_metric_alert_Transactions_operator             = var.storage_account_azurerm_monitor_metric_alert_Transactions_operator
 storage_account_azurerm_monitor_metric_alert_Transactions_threshold            = var.storage_account_azurerm_monitor_metric_alert_Transactions_threshold

storage_account_azurerm_monitor_metriclaert01  =  var.storage_account_azurerm_monitor_metriclaert01
storage_account_azurerm_monitor_metriclaert02  =  var.storage_account_azurerm_monitor_metriclaert02
storage_account_azurerm_monitor_metriclaert03  =  var.storage_account_azurerm_monitor_metriclaert03

 }

#--------------------------------------------------------------
# ACR
#--------------------------------------------------------------

module "acr" {
source =  "./modules/azurerm_container_registry"
depends_on  = [module.storageaccount]

 container_registry_resource_group_name         = var.container_registry_resource_group_name
 container_registry_resource_group_location     = var.container_registry_resource_group_location
 container_registry_resource_group_tags         = var.container_registry_resource_group_tags

 container_registry_monitor_action_group_name                         = var.container_registry_monitor_action_group_name
 container_registry_monitor_action_group_name_short_name              = var.container_registry_monitor_action_group_name_short_name
 container_registry_monitor_action_group_email_receiver_name          = var.container_registry_monitor_action_group_email_receiver_name
 container_registry_monitor_action_group_email_receiver_email_address = var.container_registry_monitor_action_group_email_receiver_email_address


container_registry_name                           = var.container_registry_name
container_registry_sku                            = var.container_registry_sku
container_registry_admin_enabled                  = var.container_registry_admin_enabled
container_registry_zone_redundancy_enabled        = var.container_registry_zone_redundancy_enabled
container_registry_public_network_access_enabled  = var.container_registry_public_network_access_enabled
azurerm_storage_account_diagstorage_id            = module.diagstracc.storage_account_id
azurerm_log_analytics_workspace_workspace_id      = module.loganalytics.loganalytics_id


container_registry_monitor_diagnostic_setting_acr_name                         = var.container_registry_monitor_diagnostic_setting_acr_name
container_registry_monitor_diagnostic_setting_metric_AllMetrics_status         = var.container_registry_monitor_diagnostic_setting_metric_AllMetrics_status
container_registry_monitor_diagnostic_setting_metric_AllMetrics_days           = var.container_registry_monitor_diagnostic_setting_metric_AllMetrics_days

container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_status = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_status
container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_days   = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_days

container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_status  = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_status
container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_days    = var.container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_days

container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_operator = var.container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_operator
container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_threshold = var.container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_threshold

container_registry_azurerm_monitor_metric_alert_RunDuration_operator  = var.container_registry_azurerm_monitor_metric_alert_RunDuration_operator
container_registry_azurerm_monitor_metric_alert_RunDuration_threshold = var.container_registry_azurerm_monitor_metric_alert_RunDuration_threshold


container_registry_azurerm_monitor_metriclaert01  = var.container_registry_azurerm_monitor_metriclaert01 
container_registry_azurerm_monitor_metriclaert02  = var.container_registry_azurerm_monitor_metriclaert02


}

#--------------------------------------------------------------
# AKV
#--------------------------------------------------------------

module "akv" {
 source =  "./modules/azurerm_key_vault"
 depends_on  = [module.acr]

 key_vault_resource_group_location    = var.key_vault_resource_group_location
 key_vault_resource_group_name        = var.key_vault_resource_group_name  
 key_vault_resource_group_tags        = var.key_vault_resource_group_tags     

 key_vault_name                           = var.key_vault_name  
 key_vault_key_vault_tenant_id            = data.azurerm_client_config.current.tenant_id
 key_vault_sku_name                       = var.key_vault_sku_name
 key_vault_enabled_for_disk_encryption    = var.key_vault_enabled_for_disk_encryption

 key_vault_monitor_action_group_name                          = var.key_vault_monitor_action_group_name
 key_vault_monitor_action_group_name_short_name               = var.key_vault_monitor_action_group_name_short_name
 key_vault_monitor_action_group_email_receiver_name           = var.key_vault_monitor_action_group_email_receiver_name
 key_vault_monitor_action_group_email_receiver_email_address  = var.key_vault_monitor_action_group_email_receiver_email_address
 key_vault_monitor_diagnostic_setting_key_vault_name          = var.key_vault_monitor_diagnostic_setting_key_vault_name

azurerm_storage_account_diagstorage_id           =   module.diagstracc.storage_account_id
azurerm_log_analytics_workspace_workspace_id     =   module.loganalytics.loganalytics_id


key_vault_name_azurerm_monitor_metric_alert_active_connections_operator    = var.key_vault_name_azurerm_monitor_metric_alert_active_connections_operator
key_vault_name_azurerm_monitor_metric_alert_active_connections_threshold   = var.key_vault_name_azurerm_monitor_metric_alert_active_connections_threshold
key_vault_name_azurerm_monitor_metriclaert01                               = var.key_vault_name_azurerm_monitor_metriclaert01


}

#--------------------------------------------------------------
# AKS
#--------------------------------------------------------------

module "aks" {
source =  "./modules/azurerm_kubernetes_cluster"
depends_on  = [module.akv]

kubernetes_cluster_resource_group_name             =  var.kubernetes_cluster_resource_group_name
kubernetes_cluster_resource_group_location         =  var.kubernetes_cluster_resource_group_location
kubernetes_cluster_resource_group_tags             =  var.kubernetes_cluster_resource_group_tags

kubernetes_cluster_monitor_action_group_name                          =  var.kubernetes_cluster_monitor_action_group_name
kubernetes_cluster_monitor_action_group_name_short_name               =  var.kubernetes_cluster_monitor_action_group_name_short_name
kubernetes_cluster_monitor_action_group_email_receiver_name           =  var.kubernetes_cluster_monitor_action_group_email_receiver_name
kubernetes_cluster_monitor_action_group_email_receiver_email_address  =  var.kubernetes_cluster_monitor_action_group_email_receiver_email_address


kubernetes_cluster_name                  = var.kubernetes_cluster_name
kubernetes_cluster_dns_prefix            = var.kubernetes_cluster_dns_prefix
kubernetes_cluster_node_resource_group   = var.kubernetes_cluster_node_resource_group  
kubernetes_cluster_vm_size               = var.kubernetes_cluster_vm_size
kubernetes_cluster_os_disk_size_gb       = var.kubernetes_cluster_os_disk_size_gb
kubernetes_cluster_availability_zones    = var.kubernetes_cluster_availability_zones
kubernetes_cluster_auto_scaling          = var.kubernetes_cluster_auto_scaling
kubernetes_cluster_min_count             = var.kubernetes_cluster_min_count
kubernetes_cluster_max_count             = var.kubernetes_cluster_max_count

kubernetes_cluster_monitor_diagnostic_setting_aks_name                     = var.kubernetes_cluster_monitor_diagnostic_setting_aks_name  
kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_status     = var.kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_status
kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_days       = var.kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_days

azurerm_storage_account_diagstorage_id           =   module.diagstracc.storage_account_id
azurerm_log_analytics_workspace_workspace_id     =   module.loganalytics.loganalytics_id

kubernetes_cluster_vnet_subnet_id                =    module.vnet.virtual_subnet_id
kubernetes_cluster_identity                      =    var.kubernetes_cluster_identity

kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_status     = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_status
kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_days       = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_days
kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_status         = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_status
kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_days           = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_days

kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_operator   = var.kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_operator 
kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_threshold  = var.kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_threshold 

kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_operator   = var.kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_operator
kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_threshold  = var.kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_threshold

kubernetes_cluster_node_pool_name = var.kubernetes_cluster_node_pool_name
kubernetes_cluster_node_pool_type = var.kubernetes_cluster_node_pool_type

kubernetes_cluster_azurerm_monitor_metriclaert01  = var.kubernetes_cluster_azurerm_monitor_metriclaert01
kubernetes_cluster_azurerm_monitor_metriclaert02  = var.kubernetes_cluster_azurerm_monitor_metriclaert02
azurerm_role_assignment_acr_id = module.acr.acr_id

}
