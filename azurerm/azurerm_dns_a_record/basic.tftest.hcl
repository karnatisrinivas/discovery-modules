variables {
  name                = "a-record"
  zone_name           = "foo.com"
  resource_group_name = "template-test-group"
  records             = ["127.0.0.1"]
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_dns_a_record.record.name == var.name
    error_message = "The DNS zone name is incorrect"
  }

  assert {
    condition     = azurerm_dns_a_record.record.records == toset(var.records)
    error_message = "The DNS records are incorrect"
  }

  assert {
    condition     = azurerm_dns_a_record.record.ttl == 300
    error_message = "The DNS TTL is incorrect"
  }
}

run "custom-ttl" {
  command = plan
  variables {
    ttl = 600

  }

  assert {
    condition     = azurerm_dns_a_record.record.ttl == 600
    error_message = "The DNS TTL is incorrect"
  }
}
