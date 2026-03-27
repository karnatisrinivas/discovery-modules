variables {
  name        = "test-backend-bucket"
  bucket_name = "test-storage-bucket"
  project     = "test-project"

  compression_mode        = "AUTOMATIC"
  custom_response_headers = ["X-Custom-Header: test"]
  description             = "Test backend bucket"
  edge_security_policy    = "test-security-policy"
  enable_cdn              = true

  cdn_policy = [{
    cache_mode                   = "CACHE_ALL_STATIC"
    client_ttl                   = 3600
    default_ttl                  = 3600
    max_ttl                      = 86400
    negative_caching             = true
    request_coalescing           = true
    serve_while_stale            = 86400
    signed_url_cache_max_age_sec = 7200

    bypass_cache_on_request_headers = [{
      header_name = "Custom-Header"
    }]

    cache_key_policy = [{
      include_http_headers   = ["Origin"]
      query_string_whitelist = ["version"]
    }]

    negative_caching_policy = [{
      code = 404
      ttl  = 300
    }]
  }]

  timeouts = {
    create = "4h"
    delete = "4h"
    update = "4h"
  }
}

run "verify_backend_bucket_plan" {
  command = plan

  assert {
    condition     = google_compute_backend_bucket.this.name == var.name
    error_message = "Backend bucket name does not match expected value"
  }
}