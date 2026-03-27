variables {
  name                = "txt"
  zone_name           = "foo.com"
  resource_group_name = "template-test-group"
  records             = ["value1", "value2"]
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_dns_txt_record.record.name == var.name
    error_message = "The DNS zone name is incorrect"
  }

  assert {
    condition     = length(setsubtract(toset([for record in azurerm_dns_txt_record.record.record : lookup(record, "value", null)]), toset(var.records))) == 0
    error_message = "The DNS records are incorrect"
  }

  assert {
    condition     = azurerm_dns_txt_record.record.ttl == 300
    error_message = "The DNS TTL is incorrect"
  }
}

run "custom-ttl" {
  command = plan
  variables {
    ttl = 600
  }

  assert {
    condition     = azurerm_dns_txt_record.record.ttl == 600
    error_message = "The DNS TTL is incorrect"
  }
}
