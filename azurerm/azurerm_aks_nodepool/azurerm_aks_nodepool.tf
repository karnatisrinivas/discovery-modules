resource "azurerm_kubernetes_cluster_node_pool" "this" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = var.aks_cluster_resource_id
  vm_size               = var.vm_size
  node_count            = var.node_count
  node_labels           = var.node_labels
  node_taints           = var.node_taints
  enable_auto_scaling   = var.enable_auto_scaling
  min_count             = var.min_count
  max_count             = var.max_count
  mode                  = var.mode
  priority              = var.spot_enabled ? "Spot" : "Regular"
  eviction_policy       = var.spot_enabled ? var.eviction_policy : null
  spot_max_price        = var.spot_enabled ? var.spot_max_price : null

  tags = var.tags
}
