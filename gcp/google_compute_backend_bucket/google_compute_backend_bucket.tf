resource "google_compute_backend_bucket" "this" {
  bucket_name             = var.bucket_name
  compression_mode        = var.compression_mode
  custom_response_headers = var.custom_response_headers
  description             = var.description
  edge_security_policy    = var.edge_security_policy
  enable_cdn              = var.enable_cdn
  name                    = var.name
  project                 = var.project

  dynamic "cdn_policy" {
    for_each = var.cdn_policy
    content {
      cache_mode                   = cdn_policy.value.cache_mode
      client_ttl                   = cdn_policy.value.client_ttl
      default_ttl                  = cdn_policy.value.default_ttl
      max_ttl                      = cdn_policy.value.max_ttl
      negative_caching             = cdn_policy.value.negative_caching
      request_coalescing           = cdn_policy.value.request_coalescing
      serve_while_stale            = cdn_policy.value.serve_while_stale
      signed_url_cache_max_age_sec = cdn_policy.value.signed_url_cache_max_age_sec

      dynamic "bypass_cache_on_request_headers" {
        for_each = cdn_policy.value.bypass_cache_on_request_headers
        content {
          header_name = bypass_cache_on_request_headers.value.header_name
        }
      }

      dynamic "cache_key_policy" {
        for_each = cdn_policy.value.cache_key_policy
        content {
          include_http_headers   = cache_key_policy.value.include_http_headers
          query_string_whitelist = cache_key_policy.value.query_string_whitelist
        }
      }

      dynamic "negative_caching_policy" {
        for_each = cdn_policy.value.negative_caching_policy
        content {
          code = negative_caching_policy.value.code
          ttl  = negative_caching_policy.value.ttl
        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
