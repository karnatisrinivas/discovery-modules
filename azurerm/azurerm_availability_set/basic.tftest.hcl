#tftest.hcl
variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-avset" # Name of the availability set


  # Optional variables with default values
  managed                      = true # Managed availability set (recommended)
  platform_fault_domain_count  = 2    # Default for most Azure regions
  platform_update_domain_count = 5    # Default for most Azure regions
  proximity_placement_group_id = null # Default to no proximity placement group

  # Optional tags
  tags = {}
}

run "basic" {
  command = apply
  assert {
    condition     = azurerm_availability_set.this.name == var.name
    error_message = "failed to execute terraform apply with basic settings"
  }
}
