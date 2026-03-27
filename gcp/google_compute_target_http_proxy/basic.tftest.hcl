variables {
  name    = "test-http-proxy"
  url_map = "test-url-map"

  description                 = "Test HTTP proxy description"
  http_keep_alive_timeout_sec = 610
  project                     = "test-project"
  proxy_bind                  = true

  timeouts = {
    create = "4h"
    delete = "4h"
    update = "4h"
  }
}

run "create_target_http_proxy" {
  command = plan

  assert {
    condition     = google_compute_target_http_proxy.this.name == var.name
    error_message = "Target HTTP proxy name did not match expected value"
  }
}
