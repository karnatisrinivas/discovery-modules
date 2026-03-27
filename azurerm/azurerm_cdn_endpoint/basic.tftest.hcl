variables {
  subscription_id           = "12345678-1234-9876-4563-123456789012"
  create_resource_group     = "false"
  location                  = "eastus"
  resource_group_name       = "test-vm"
  name                      = "cdnendpoint"
  profile_name              = "cdn_endpoint"
  is_http_allowed           = true
  is_https_allowed          = true
  content_types_to_compress = []
  is_compression_enabled    = true
  geo_filter = [
    {
      relative_path = "path"
      action        = "Allow"
      country_codes = ["US"]
    }
  ]
  querystring_caching_behaviour = "BypassCaching"
  optimization_type             = "LargeFileDownload"
  origin = [{

    name       = "origin"
    host_name  = "originhost"
    http_port  = 80
    https_port = 443

  }]
  origin_host_header   = "hostheader"
  origin_path          = "originpath"
  probe_path           = "probe_path"
  tags                 = {}
  global_delivery_rule = []
  delivery_rule        = []
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_cdn_endpoint.this.name == "cdnendpoint"
    error_message = "azurerm_cdn_endpoint was not successful"
  }
}