variables {
  domain              = "foobar.com"
  resource_group_name = "template-test-group"
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_dns_zone.zone.name == "foobar.com"
    error_message = "The DNS zone name is incorrect"
  }

  // verify output name
  assert {
    condition     = output.name == "foobar.com"
    error_message = "The DNS zone name is incorrect"
  }
}
