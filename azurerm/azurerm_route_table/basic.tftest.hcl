variables {
  name                  = "srroutetable"
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "eastus"
  resource_group_name   = "testgrp"
  route = [
    {
      name                   = "route1"
      address_prefix         = "10.0.0.0/24"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.0.1"
    }
  ]
  timeouts = {
    create = "10m"
    read   = "5m"
    update = "10m"
    delete = "10m"
  }
  tags = {
    "rest" = "test"
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_route_table.this.name == "srroutetable"
    error_message = "azurerm_route_table was not succesful"
  }
}
