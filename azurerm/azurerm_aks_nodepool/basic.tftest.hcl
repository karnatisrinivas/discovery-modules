variables {
  subscription_id         = "12345678-1234-9876-4563-123456789012"
  location                = "East US"
  resource_group_name     = "test-nodepool-rg"
  create_resource_group   = "false"
  node_pool_name          = "testnp"
  aks_cluster_resource_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/test-nodepool-rg/providers/Microsoft.ContainerService/managedClusters/test-nodepool"
  node_labels = {
    "Name"        = "cluster-test"
    "Region"      = "us-east"
    "Environment" = "dev"
  }
  node_taints         = ["key1=value1:NoSchedule"]
  vm_size             = "Standard_D2_v3"
  node_count          = 1
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 100
  spot_enabled        = false
  eviction_policy     = "Delete"
  spot_max_price      = -1
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_kubernetes_cluster_node_pool.this.name == "testnp"
    error_message = "Azure AKS name is not correct"
  }
}
