resource "google_network_security_server_tls_policy" "this" {
  allow_open  = var.allow_open
  description = var.description
  labels      = var.labels
  location    = var.location
  name        = var.name

  dynamic "mtls_policy" {
    for_each = var.mtls_policy
    content {
      client_validation_mode         = mtls_policy.value.client_validation_mode
      client_validation_trust_config = mtls_policy.value.client_validation_trust_config

      dynamic "client_validation_ca" {
        for_each = mtls_policy.value.client_validation_ca
        content {
          dynamic "certificate_provider_instance" {
            for_each = client_validation_ca.value.certificate_provider_instance
            content {
              plugin_instance = certificate_provider_instance.value.plugin_instance
            }
          }

          dynamic "grpc_endpoint" {
            for_each = client_validation_ca.value.grpc_endpoint
            content {
              target_uri = grpc_endpoint.value.target_uri
            }
          }

        }
      }

    }
  }

  dynamic "server_certificate" {
    for_each = var.server_certificate
    content {
      dynamic "certificate_provider_instance" {
        for_each = server_certificate.value.certificate_provider_instance
        content {
          plugin_instance = certificate_provider_instance.value.plugin_instance
        }
      }

      dynamic "grpc_endpoint" {
        for_each = server_certificate.value.grpc_endpoint
        content {
          target_uri = grpc_endpoint.value.target_uri
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
