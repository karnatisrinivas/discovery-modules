variables {
  name                = "srv"
  zone_name           = "foo.com"
  resource_group_name = "template-test-group"
  records = [{
    priority = 100
    weight   = 1
    port     = 443
    target   = "target1.foo.com"
  }]
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_dns_srv_record.record.name == var.name
    error_message = "The DNS zone name is incorrect"
  }

  assert {
    condition     = length(setsubtract(azurerm_dns_srv_record.record.record, toset(var.records))) == 0
    error_message = "The DNS records are incorrect"
  }

  assert {
    condition     = azurerm_dns_srv_record.record.ttl == 300
    error_message = "The DNS TTL is incorrect"
  }
}

run "custom-ttl" {
  command = plan
  variables {
    ttl = 600
  }

  assert {
    condition     = azurerm_dns_srv_record.record.ttl == 600
    error_message = "The DNS TTL is incorrect"
  }
}
