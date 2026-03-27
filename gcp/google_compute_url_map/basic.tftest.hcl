variables {
  name            = "test-url-map"
  default_service = null
  description     = "Test URL map for basic functionality"
  project         = "test-project"

  host_rule = [{
    hosts        = ["example.com"]
    path_matcher = "main"
    description  = "Main host rule"
  }]

  path_matcher = [{
    name            = "main"
    default_service = "projects/test-project/global/backendServices/default-backend"
    description     = "Main path matcher"

    default_route_action = []
    default_url_redirect = []
    header_action        = []
    route_rules          = []

    path_rule = [{
      paths        = ["/api/*"]
      service      = "projects/test-project/global/backendServices/api-backend"
      route_action = []
      url_redirect = [{
        strip_query = true
      }]
    }]
  }]

  test = [{
    host        = "example.com"
    path        = "/api/test"
    service     = "projects/test-project/global/backendServices/api-backend"
    description = "Test API path routing"
  }]

  timeouts = {
    create = "4m"
    update = "4m"
    delete = "4m"
  }

  default_route_action = null

  default_url_redirect = [{
    https_redirect         = true
    strip_query            = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
  }]

  header_action = [{
    request_headers_to_remove  = ["X-Remove-Me"]
    response_headers_to_remove = ["X-Remove-Response"]
    request_headers_to_add = [{
      header_name  = "X-Custom-Request"
      header_value = "test-value"
      replace      = true
    }]
    response_headers_to_add = [{
      header_name  = "X-Custom-Response"
      header_value = "response-value"
      replace      = true
    }]
  }]
}

run "test" {
  command = plan

  assert {
    condition     = google_compute_url_map.this.name == var.name
    error_message = "URL map name does not match expected value"
  }
}
