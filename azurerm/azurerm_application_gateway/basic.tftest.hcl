variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-appgateway"

  sku = [{
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 0
  }]


  identity_ids = ["/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/test-identity"]

  ssl_certificates = []

  gateway_ip_configuration = [{
    name      = "example-gateway-ip-configuration"
    subnet_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/default"
  }]

  frontend_port = [{
    name = "example-frontend-port"
    port = 80
  }]

  frontend_ip_configuration = [{
    name                          = "example-frontend-ip-configuration"
    subnet_id                     = null
    public_ip_address_id          = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/publicIPAddresses/pip-1-example"
    private_ip_address            = null
    private_ip_address_allocation = "Dynamic"
  }]

  backend_address_pool = [{
    name         = "example-backend-address-pool"
    fqdns        = null
    ip_addresses = ["10.0.0.1"]
  }]

  probes = [{
    name                                      = "my-probe"
    interval                                  = 60
    path                                      = "/custompath"
    protocol                                  = "Http"
    timeout                                   = 60
    unhealthy_threshold                       = 15
    port                                      = 80
    pick_host_name_from_backend_http_settings = true
    host                                      = null
  }]

  backend_http_settings = [{
    name                 = "example-backend-http-settings"
    path                 = "/"
    port                 = 88
    protocol             = "Http"
    request_timeout      = 60
    affinity_cookie_name = "my-cookie"
    probe_name           = "my-probe"
    host_name            = "testhost"
    drain_timeout_sec    = 2
  }]

  http_listener = [{
    name                           = "example-http-listener"
    frontend_ip_configuration_name = "example-frontend-ip-configuration"
    frontend_port_name             = "example-frontend-port"
    protocol                       = "Http"
    host_name                      = "host"
    require_sni                    = false
    ssl_certificate_name           = null
  }]

  request_routing_rule = [{
    name                        = "example-request-routing-rule"
    rule_type                   = "Basic"
    priority                    = 2
    http_listener_name          = "example-http-listener"
    backend_address_pool_name   = "example-backend-address-pool"
    backend_http_settings_name  = "example-backend-http-settings"
    redirect_configuration_name = null
    url_path_map_name           = null
  }]

  redirect_configurations = [{
    name                 = "my-redi-conf"
    redirect_type        = "Permanent"
    target_listener_name = "example-http-listener"
    target_url           = ""
    include_path         = true
    include_query_string = true
  }]

  url_path_maps = [{
    name                               = "my-url-path"
    default_backend_http_settings_name = "example-backend-http-settings"
    default_backend_address_pool_name  = "example-backend-address-pool"
    path_rules = [{
      name                       = "pathrule"
      paths                      = ["/whatever"],
      backend_address_pool_name  = "example-backend-address-pool"
      backend_http_settings_name = "example-backend-http-settings"
    }]
  }]

  autoscale_max_capacity = 99
  autoscale_min_capacity = 3

  enable_http2                      = false
  fips_enabled                      = false
  firewall_policy_id                = null
  force_firewall_policy_association = false
  tags = {
    environment = "test"
  }
  zones = null
}

run "create_application_gateway" {
  command = apply

  assert {
    condition     = azurerm_application_gateway.this.name == var.name
    error_message = "Application Gateway name does not match the expected value"
  }
}