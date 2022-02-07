resource "azurerm_role_assignment" "acr_image_puller" {
  scope                = var.azurerm_role_assignment_acr_id
  role_definition_name = "AcrPull"
  principal_id         =  azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
}