# Resource Group for AKS Cluster
resource "azurerm_resource_group" "resource_group" {
  name                           = var.kubernetes_cluster_resource_group_name
  location                       = var.kubernetes_cluster_resource_group_location
  tags                           = var.kubernetes_cluster_resource_group_tags
}

# AKS
resource "azurerm_kubernetes_cluster" "aks" {
  depends_on                      = [azurerm_monitor_action_group.actiongroup]
  name                            = var.kubernetes_cluster_name
  location                        = var.kubernetes_cluster_resource_group_location
  resource_group_name             = var.kubernetes_cluster_resource_group_name
  dns_prefix                      = var.kubernetes_cluster_dns_prefix
  node_resource_group             = var.kubernetes_cluster_node_resource_group

  default_node_pool {
    name                = var.kubernetes_cluster_node_pool_name
    type                = var.kubernetes_cluster_node_pool_type
    vm_size             = var.kubernetes_cluster_vm_size
    os_disk_size_gb     = var.kubernetes_cluster_os_disk_size_gb 
    availability_zones  = var.kubernetes_cluster_availability_zones
    enable_auto_scaling = var.kubernetes_cluster_auto_scaling
    min_count           = var.kubernetes_cluster_min_count
    max_count           = var.kubernetes_cluster_max_count
    vnet_subnet_id      = "%{ if var.subnetstatus == "false" }${var.kubernetes_cluster_vnet_subnet_id}%{ else }${var.kubernetes_cluster_vnet_subnet_id}%{ endif }"
  }

  identity {
    type = var.kubernetes_cluster_identity
  }
  
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "Standard"
  }

  addon_profile {
    azure_policy {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.azurerm_log_analytics_workspace_workspace_id
    }
  }
}

# Email Action Group
resource "azurerm_monitor_action_group" "actiongroup" {
  depends_on          = [azurerm_resource_group.resource_group]
  name                = var.kubernetes_cluster_monitor_action_group_name
  resource_group_name = var.kubernetes_cluster_resource_group_name
  short_name          = var.kubernetes_cluster_monitor_action_group_name_short_name

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
  depends_on                  = [azurerm_kubernetes_cluster.aks]
  name                        = var.kubernetes_cluster_monitor_diagnostic_setting_aks_name
  target_resource_id          = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_workspace_id
  storage_account_id          = var.azurerm_storage_account_diagstorage_id
  
  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = var.kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_status
      days    = var.kubernetes_cluster_monitor_diagnostic_setting_metric_AllMetrics_days
    }
  }

  log {
    category = "kube-apiserver"
    enabled  = true

    retention_policy {
      enabled  = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_status
      days     = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-apiserver_days
    }
  }
  
  log {
    category = "kube-audit"
    enabled  = true

    retention_policy {
       enabled = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_status
          days = var.kubernetes_cluster_monitor_diagnostic_setting_log_kube-audit_days
    }
  }
}

# Azure Metric alert for  metric - kube_pod_status_ready
resource "azurerm_monitor_metric_alert" "metriclaert01" {
  depends_on          = [azurerm_monitor_diagnostic_setting.diagnostic_setting]
  name                = "alert01"
  resource_group_name = var.kubernetes_cluster_resource_group_name
  scopes              = [azurerm_kubernetes_cluster.aks.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.kubernetes_cluster_azurerm_monitor_metriclaert01

  criteria {
    metric_namespace  = "Microsoft.ContainerService/managedClusters"
    metric_name       = "kube_pod_status_ready"
    aggregation       = "Total"
    operator          = var.kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_operator
    threshold         = var.kubernetes_cluster_azurerm_monitor_metric_alert_kube_pod_status_ready_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}

# Azure Metric alert for  metric - node_cpu_usage_percentage
resource "azurerm_monitor_metric_alert" "metriclaert02" {
  depends_on          = [azurerm_monitor_metric_alert.metriclaert01]
  name                = "alert02"
  resource_group_name = var.kubernetes_cluster_resource_group_name
  scopes              = [azurerm_kubernetes_cluster.aks.id]
  window_size         = "PT1H"
  frequency           = "PT1H"
  enabled             = var.kubernetes_cluster_azurerm_monitor_metriclaert02

  criteria {
    metric_namespace  = "Microsoft.ContainerService/managedClusters"
    metric_name       = "node_cpu_usage_percentage"
    aggregation       = "Maximum"
    operator          = var.kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_operator
    threshold         = var.kubernetes_cluster_azurerm_monitor_metric_alert_node_cpu_usage_percentage_threshold
  }

  action {
    action_group_id   = azurerm_monitor_action_group.actiongroup.id
  }
}