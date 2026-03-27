resource "google_monitoring_uptime_check_config" "this" {
  checker_type       = var.checker_type
  display_name       = var.display_name
  log_check_failures = var.log_check_failures
  period             = var.period
  selected_regions   = var.selected_regions
  timeout            = var.timeout
  user_labels        = var.user_labels

  dynamic "content_matchers" {
    for_each = var.content_matchers
    content {
      content = content_matchers.value.content
      matcher = content_matchers.value.matcher

      dynamic "json_path_matcher" {
        for_each = content_matchers.value.json_path_matcher
        content {
          json_matcher = json_path_matcher.value.json_matcher
          json_path    = json_path_matcher.value.json_path
        }
      }

    }
  }

  dynamic "http_check" {
    for_each = var.http_check
    content {
      body                = http_check.value.body
      content_type        = http_check.value.content_type
      custom_content_type = http_check.value.custom_content_type
      headers             = http_check.value.headers
      mask_headers        = http_check.value.mask_headers
      path                = http_check.value.path
      port                = http_check.value.port
      request_method      = http_check.value.request_method
      use_ssl             = http_check.value.use_ssl
      validate_ssl        = http_check.value.validate_ssl

      dynamic "accepted_response_status_codes" {
        for_each = http_check.value.accepted_response_status_codes
        content {
          status_class = accepted_response_status_codes.value.status_class
          status_value = accepted_response_status_codes.value.status_value
        }
      }

      dynamic "auth_info" {
        for_each = http_check.value.auth_info
        content {
          password            = auth_info.value.password
          password_wo         = auth_info.value.password_wo
          password_wo_version = auth_info.value.password_wo_version
          username            = auth_info.value.username
        }
      }

      dynamic "ping_config" {
        for_each = http_check.value.ping_config
        content {
          pings_count = ping_config.value.pings_count
        }
      }

      dynamic "service_agent_authentication" {
        for_each = http_check.value.service_agent_authentication
        content {
          type = service_agent_authentication.value.type
        }
      }

    }
  }

  dynamic "monitored_resource" {
    for_each = var.monitored_resource
    content {
      labels = monitored_resource.value.labels
      type   = monitored_resource.value.type
    }
  }

  dynamic "resource_group" {
    for_each = var.resource_group
    content {
      group_id      = resource_group.value.group_id
      resource_type = resource_group.value.resource_type
    }
  }

  dynamic "synthetic_monitor" {
    for_each = var.synthetic_monitor
    content {
      dynamic "cloud_function_v2" {
        for_each = synthetic_monitor.value.cloud_function_v2
        content {
          name = cloud_function_v2.value.name
        }
      }

    }
  }

  dynamic "tcp_check" {
    for_each = var.tcp_check
    content {
      port = tcp_check.value.port

      dynamic "ping_config" {
        for_each = tcp_check.value.ping_config
        content {
          pings_count = ping_config.value.pings_count
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
