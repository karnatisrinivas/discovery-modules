variables {
  name = "demo"
}

run "test" {
  command = plan
  assert {
    condition     = data.azurerm_route_table.this.name == "demo"
    error_message = "The name of the Route Table is not correct"
  }
}