data "azurerm_kubernetes_cluster_node_pool" "this" {
  kubernetes_cluster_name = var.kubernetes_cluster_name
  name                    = var.name
  resource_group_name     = var.resource_group_name

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
