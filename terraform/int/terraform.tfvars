#--------------------------------------------------------------
# Diagnostic Storage Account
# To Be Added - storage_account_access_tier                                         = "Hot"
# To Be Added - storage_account_min_tls_version                                     = "TLS1_0"
# To Be Added - Need to move the logic to Storage Account with the flag to disable diagostic storage account which will not create diagnostic Storage Account
#--------------------------------------------------------------
 
 diag_storage_account_resource_group_name                                 = "rg-stdiag-int-001"
 diag_storage_account_resource_group_location                             = "westeurope"
 diag_storage_account_name                                                = "stdiagint001"
 diag_storage_account_tier                                                = "Standard"
 diag_storage_account_tier_replication_type                               = "LRS"
 diag_storage_account_access_tier                                         = "Hot"
 diag_storage_account_min_tls_version                                     = "TLS1_0"
 
 diag_storage_account_resource_group_tags                                 = {
    "mbmAppName"              = "crd"
	"mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
	"mbmIso"                  = ""
	"mbmPersonalData"         = ""
	"mbmPlanningItId"         = ""
	"mbmProductiveData"       = ""
	"mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
	"mbmConfidentiality"      = ""
	"mbmIntegrity"            = ""
	"mbmAvailability"         = ""
	"mbmContinuityCritical"   = ""
 }

 diag_storage_account_monitor_action_group_name                            =  "ag-email-diagstorage-int-001"
 diag_storage_account_monitor_action_group_name_short_name                 =  "intstoact"
 
 diag_storage_account_monitor_action_group_email_receiver_name             =  ["arunemail","vinayemail"]
 diag_storage_account_monitor_action_group_email_receiver_email_address    =   ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]

 
 diag_storage_account_azurerm_monitor_metric_alert_Availability_operator    =  "GreaterThan"
 diag_storage_account_azurerm_monitor_metric_alert_Availability_threshold   =   "80"

 diag_storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator    = "GreaterThan"
 diag_storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold   =  "80"

 diag_storage_account_azurerm_monitor_metric_alert_Transactions_operator     = "GreaterThan"
 diag_storage_account_azurerm_monitor_metric_alert_Transactions_threshold    =  "80"

 
 diag_storage_account_azurerm_monitor_metriclaert01  =  "true"
 diag_storage_account_azurerm_monitor_metriclaert02  =  "false"
 diag_storage_account_azurerm_monitor_metriclaert03  =  "false"
#-------------------------------------------------------------------------------------------------------------------
# Log Analytics
# To Be Added - log_analytics_group_name, log_analytics_workspace_location
# To Be Verified - log_analytics_workspace_sku
# Can move the log analytics to seperate module
#- AS log analytics is fundamental module so we are using  Dianostic storage account  resource group  and location
#---------------------------------------------------------------------------------------------------------------------
# log_analytics_group_name           = "rg-log-int-001"
# log_analytics_workspace_location   = "westeurope"
 log_analytics_workspace_sku        = "PerGB2018"
 log_analytics_workspace_name       = "log-crd-int-001"
 
#--------------------------------------------------------------
#  VNET
# To Be done - Supporting Multiple Subnets
# To be discussed - virtual_network_subnet_enforce_private_link_endpoint_network_policies
# To Be Done - Need to pass a flag to create vnet or not
#--------------------------------------------------------------

 virtual_network_resource_group_name     = "rg-vnet-int-001"
 virtual_network_resource_group_location = "westeurope"
 virtual_network_name                    = "vnet-int-westeurope-001"
 virtual_network_address_space           = ["15.0.0.0/8"]

 virtual_network_subnet_name             = "snet-db-int-westeurope-001"
 virtual_network_subnet_address_prefixes = ["15.0.0.0/16"]
 virtual_network_subnet_enforce_private_link_endpoint_network_policies = false
 
 virtual_network_resource_group_tags =  {
    "mbmAppName"              = "crd"
	"mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
	"mbmIso"                  = ""
	"mbmPersonalData"         = ""
	"mbmPlanningItId"         = ""
	"mbmProductiveData"       = ""
	"mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
	"mbmConfidentiality"      = ""
	"mbmIntegrity"            = ""
	"mbmAvailability"         = ""
	"mbmContinuityCritical"   = ""
 }

 virtual_network_monitor_action_group_name                         = "ag-email-vnet-int-001"
 virtual_network_monitor_action_group_name_short_name              = "intvnetact"
 
 virtual_network_monitor_action_group_email_receiver_name             =  ["arunemail","vinayemail"]
 virtual_network_monitor_action_group_email_receiver_email_address    =   ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]

 virtual_network_monitor_diagnostic_setting_vnet_name = "vnetdiagint001"
 virtual_network_monitor_diagnostic_setting_metric_AllMetrics_status = "true"
 virtual_network_monitor_diagnostic_setting_metric_AllMetrics_days = "30"

 virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_status = "true"
 virtual_network_monitor_diagnostic_setting_log_VMProtectionAlerts_days = "30"

 virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_operator = "GreaterThan"
 virtual_network_azurerm_monitor_metric_alert_IfUnderDDoSAttack_threshold = "10"

 virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_operator = "GreaterThan"
 virtual_network_azurerm_monitor_metric_alert_BytesInDDoS_threshold = "10"

 virtual_network_azurerm_monitor_metric_metriclaert1 = "false"
 virtual_network_azurerm_monitor_metric_metriclaert2 =  "true"
  
#--------------------------------------------------------------
#  STORAGE ACCOUNT
#--------------------------------------------------------------

 storage_account_resource_group_name                                 = "rg-storage-int-001"
 storage_account_resource_group_location                             = "westeurope"
 storage_account_name                                                = "stcrddataint001"
 storage_account_tier                                                = "Standard"
 storage_account_tier_replication_type                               = "LRS"
 storage_account_access_tier                                         = "Hot"
 storage_account_min_tls_version                                     = "TLS1_0"
 
 storage_account_resource_group_tags                                 = {
    "mbmAppName"              = "crd"
	"mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
	"mbmIso"                  = ""
	"mbmPersonalData"         = ""
	"mbmPlanningItId"         = ""
	"mbmProductiveData"       = ""
	"mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
	"mbmConfidentiality"      = ""
	"mbmIntegrity"            = ""
	"mbmAvailability"         = ""
	"mbmContinuityCritical"   = ""
 }

 storage_account_monitor_action_group_name                            =  "ag-email-storage-int-001"
 storage_account_monitor_action_group_name_short_name                 =  "intstoact"
 
 storage_account_monitor_action_group_email_receiver_name             =  ["arunemail","vinayemail"]
 storage_account_monitor_action_group_email_receiver_email_address    =   ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]

 storage_account_monitor_diagnostic_setting_storage_name                        =  "strdiagint001"
 storage_account_monitor_diagnostic_setting_storage_metric_Transaction_status   =   "true"
 storage_account_monitor_diagnostic_setting_storage_metric_Transaction_days     =    "30"

 storage_account_azurerm_monitor_metric_alert_Availability_operator    =  "GreaterThan"
 storage_account_azurerm_monitor_metric_alert_Availability_threshold   =   "80"

 storage_account_azurerm_monitor_metric_alert_UsedCapacity_operator    = "GreaterThan"
 storage_account_azurerm_monitor_metric_alert_UsedCapacity_threshold   =  "80"

 storage_account_azurerm_monitor_metric_alert_Transactions_operator     = "GreaterThan"
 storage_account_azurerm_monitor_metric_alert_Transactions_threshold    =  "80"

 
 storage_account_azurerm_monitor_metriclaert01  =  "true"
 storage_account_azurerm_monitor_metriclaert02  =  "false"
 storage_account_azurerm_monitor_metriclaert03  =  "false"
 
#--------------------------------------------------------------
#  ACR
# Diagnostic Storage Account should be moved to main.tf
#--------------------------------------------------------------

 container_registry_resource_group_name            = "rg-acr-int-001"
 container_registry_resource_group_location        = "westeurope"
 container_registry_name                           = "crcrdint001"
 container_registry_sku                            = "Premium"
 container_registry_admin_enabled                  = "false"
 container_registry_zone_redundancy_enabled        = "false"
 container_registry_public_network_access_enabled  = "true"
 
 container_registry_resource_group_tags         =  {
    "mbmAppName"              = "crd"
    "mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
    "mbmIso"                  = ""
    "mbmPersonalData"         = ""
    "mbmPlanningItId"         = ""
    "mbmProductiveData"       = ""
    "mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
    "mbmConfidentiality"      = ""
    "mbmIntegrity"            = ""
    "mbmAvailability"         = ""
    "mbmContinuityCritical"   = ""
 }

 container_registry_monitor_action_group_name                          =  "ag-email-acr-int-001"
 container_registry_monitor_action_group_name_short_name               =  "intacract"
 container_registry_monitor_action_group_email_receiver_name           =  ["arunemail","vinayemail"]
 container_registry_monitor_action_group_email_receiver_email_address  =  ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]

 container_registry_monitor_diagnostic_setting_acr_name                         = "acrdiagint001"
 container_registry_monitor_diagnostic_setting_metric_AllMetrics_status         = "true"
 container_registry_monitor_diagnostic_setting_metric_AllMetrics_days           = "30"               

 container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_status = "true"
 container_registry_monitor_diagnostic_setting_log_ContainerRegistryLoginEvents_days   = "30"

 container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_status  = "true"
 container_registry_monitor_diagnostic_setting_log_ContainerRegistryRepositoryEvents_days    = "30"

 container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_operator = "GreaterThan"
 container_registry_azurerm_monitor_metric_alert_AgentPoolCPUTime_threshold = "80"

 container_registry_azurerm_monitor_metric_alert_RunDuration_operator =  "GreaterThan"
 container_registry_azurerm_monitor_metric_alert_RunDuration_threshold = "80"

 container_registry_azurerm_monitor_metriclaert01 = "true"
 container_registry_azurerm_monitor_metriclaert02 = "true"



#--------------------------------------------------------------
# POSTGRESQL
# SKU to be reviewed
#--------------------------------------------------------------
 postgresql_server_resource_group_name                                               = "rg-psql-int-001"
 postgresql_server_resource_group_location                                           = "westeurope"
 postgresql_server_name                                                              = "psql-crd-int-001"
 postgresql_server_username                                                          = "crdintadmin"
 postgresql_server_password                                                          = "H@Sh1CoR3!"
 postgresql_server_sku                                                               = "GP_Standard_D4s_v3"
 postgresql_server_version                                                           = "12"
 postgresql_server_storage_mb                                                        = "32768"
 postgresql_server_backup_retention_days                                             = "7"
 postgresql_server_geo_redundant_backup_enabled                                      = "true"
 
 
 postgresql_server_resource_group_tags                                               =  {
    "mbmAppName"              = "crd"
    "mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
    "mbmIso"                  = ""
    "mbmPersonalData"         = ""
    "mbmPlanningItId"         = ""
    "mbmProductiveData"       = ""
    "mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
    "mbmConfidentiality"      = ""
    "mbmIntegrity"            = ""
    "mbmAvailability"         = ""
    "mbmContinuityCritical"   = ""
 }

 postgresql_server_monitor_action_group_name                                         = "ag-email-psql-int-001"
 postgresql_server_monitor_action_group_name_short_name                              = "intpsqlact"
 
 postgresql_server_monitor_action_group_email_receiver_name                          =  ["arunemail","vinayemail"]
 postgresql_server_monitor_action_group_email_receiver_email_address                 =  ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]
 
 postgresql_server_monitor_diagnostic_setting_postgresql_server_name                 = "psqldiagint001"
 postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_status               = "true"
 postgresql_server_monitor_diagnostic_setting_metric_AllMetrics_days                 = "30"

 postgresql_server_azurerm_monitor_metric_alert_active_connections_operator           = "GreaterThan"
 postgresql_server_azurerm_monitor_metric_alert_active_connections_threshold          = "10"

 postgresql_server_azurerm_monitor_metric_alert_connections_failed_operator           = "GreaterThan"
 postgresql_server_azurerm_monitor_metric_alert_connections_failed_threshold          = "10"

 postgresql_server_azurerm_monitor_metric_alert_storage_used_operator                 = "GreaterThan"
 postgresql_server_azurerm_monitor_metric_alert_storage_used_threshold                = "10"

 postgresql_server_azurerm_monitor_metriclaert01  = "false"
 postgresql_server_azurerm_monitor_metriclaert02  = "false"
 postgresql_server_azurerm_monitor_metriclaert03 = "true"

#--------------------------------------------------------------
# AKV
#--------------------------------------------------------------

 key_vault_resource_group_name         = "rg-kv-int-001"
 key_vault_resource_group_location     = "westeurope"
 key_vault_name                        = "kvcrdduatwesteurope001"
 key_vault_sku_name                    = "standard"
 key_vault_enabled_for_disk_encryption = "true"

 key_vault_resource_group_tags          = {
    "mbmAppName"              = "crd"
    "mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
    "mbmIso"                  = ""
    "mbmPersonalData"         = ""
    "mbmPlanningItId"         = ""
    "mbmProductiveData"       = ""
    "mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
    "mbmConfidentiality"      = ""
    "mbmIntegrity"            = ""
    "mbmAvailability"         = ""
    "mbmContinuityCritical"   = ""
 }
 
 key_vault_monitor_action_group_name                              =  "ag-email-kv-int-001"
 key_vault_monitor_action_group_name_short_name                   =  "intkvact"
 key_vault_monitor_action_group_email_receiver_name               =  ["arunemail","vinayemail"]
 key_vault_monitor_action_group_email_receiver_email_address      =  ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]
 
 key_vault_monitor_diagnostic_setting_key_vault_name  = "akvdiagint001"

 key_vault_name_azurerm_monitor_metric_alert_active_connections_operator   = "GreaterThan"
 key_vault_name_azurerm_monitor_metric_alert_active_connections_threshold   = "80"

 key_vault_name_azurerm_monitor_metriclaert01 = "true"
 
#--------------------------------------------------------------
# AKS
# To Be Done - Vnet Name and Vnet Subnet to be added
# To Be Done - Node Pool name to be updated
# To Be Done - Is it possible to add the array of the Node Pools
# To Be Done - Review of AKS parameters
#--------------------------------------------------------------

 kubernetes_cluster_resource_group_name             = "rg-aks-int-001"
 kubernetes_cluster_resource_group_location         = "westeurope"
 kubernetes_cluster_name                            = "aks-crd-dev-001"          
 kubernetes_cluster_dns_prefix                      = "aks-crd-dev-001"
 kubernetes_cluster_node_resource_group             = "agentpool" 
 kubernetes_cluster_vm_size                         = "Standard_DS2_v2"             
 kubernetes_cluster_os_disk_size_gb                 = "30"
 kubernetes_cluster_availability_zones              = [1]
 kubernetes_cluster_auto_scaling                    = "true"
 kubernetes_cluster_min_count                       = "2"
 kubernetes_cluster_max_count                       = "5"      
 
 
 kubernetes_cluster_resource_group_tags             = {
    "mbmAppName"              = "crd"
    "mbmCloudSecResponsible"  = ""
    "mbmEnvironment"          = "INT"
    "mbmInformationOwner"     = ""
    "mbmIso"                  = ""
    "mbmPersonalData"         = ""
    "mbmPlanningItId"         = ""
    "mbmProductiveData"       = ""
    "mbmTechnicalOwner"       = "ibm.arya@daimler.com, hemant.soni@daimler.com"
    "mbmTechnicalOwnerContact"= "hemant.soni@daimler.com"
    "mbmConfidentiality"      = ""
    "mbmIntegrity"            = ""
    "mbmAvailability"         = ""
    "mbmContinuityCritical"   = ""
 }
     
 kubernetes_cluster_monitor_action_group_name                                    =  "ag-email-vnet-int-001"
 kubernetes_cluster_monitor_action_group_name_short_name                         =  "intaksact"
 kubernetes_cluster_monitor_action_group_email_receiver_name                     =  ["arunemail","vinayemail"]
 kubernetes_cluster_monitor_action_group_email_receiver_email_address            =  ["arunachalam.sakthivel@daimler.com","ibm.arya@daimler.com"]

 kubernetes_cluster_monitor_diagnostic_setting_aks_name                     =  "aksdiagint001"                   
 kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_status     =   "true"
 kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_days       =   "30"

 kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_status    =  "true"
 kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_days      =    "30"

 kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_status        =  "true"     
 kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_days          =   "50"

 kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_operator   = "GreaterThan"
 kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_threshold  = "50"

 kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_operator    = "GreaterThan"
 kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_threshold   = "50"

 
 kubernetes_cluster_identity = "SystemAssigned"
 kubernetes_cluster_node_pool_name  = "systempool"
 kubernetes_cluster_node_pool_type  = "VirtualMachineScaleSets"

 
  kubernetes_cluster_azurerm_monitor_metriclaert01  = "false"
  kubernetes_cluster_azurerm_monitor_metriclaert02  = "true"



#authentication
    azurerm_client_id        =   "d31a1b6d-90f3-44e6-9787-e5a433eb4e80"
    azurerm_client_secret    =   "viO7Q~C6PPf1.nBkpR6iyvV3OUlyfMlFIUKnB"
    azurerm_tenant_id        =   "9652d7c2-1ccf-4940-8151-4a92bd474ed0"
    azurerm_subscription_id  =   "73fe470c-a6ec-49c3-8973-4d5e062b6d6b"