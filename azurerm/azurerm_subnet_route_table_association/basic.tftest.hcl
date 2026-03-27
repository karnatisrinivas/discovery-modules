variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "eastus"
  name                  = "srroutetable"
  resource_group_name   = "testgrp"
  subnet_id             = "testsubnet"
  route_table_id        = "testroutetable"

}
run "test" {
  command = plan
  assert {
    condition     = azurerm_subnet_route_table_association.this.name != null
    error_message = "azurerm_subnet_route_table_association was not succesful"
  }
}
