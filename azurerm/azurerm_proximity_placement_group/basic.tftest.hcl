variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  # Required values (replace with actual values)
  name             = "example-1"
  allowed_vm_sizes = ["Standard_B1s"]
  zone             = null
  tags             = null
}

run "create_proximity_placement_group" {
  command = apply

  assert {
    condition     = azurerm_proximity_placement_group.this.name == var.name
    error_message = "Proximity Placement group name does not match expected value"
  }
}