resource "google_iam_workload_identity_pool_provider" "this" {
  attribute_condition                = var.attribute_condition
  attribute_mapping                  = var.attribute_mapping
  description                        = var.description
  disabled                           = var.disabled
  display_name                       = var.display_name
  workload_identity_pool_id          = var.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id

  dynamic "aws" {
    for_each = var.aws
    content {
      account_id = aws.value.account_id
    }
  }

  dynamic "oidc" {
    for_each = var.oidc
    content {
      allowed_audiences = oidc.value.allowed_audiences
      issuer_uri        = oidc.value.issuer_uri
      jwks_json         = oidc.value.jwks_json
    }
  }

  dynamic "saml" {
    for_each = var.saml
    content {
      idp_metadata_xml = saml.value.idp_metadata_xml
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

  dynamic "x509" {
    for_each = var.x509
    content {
      dynamic "trust_store" {
        for_each = x509.value.trust_store
        content {
          dynamic "intermediate_cas" {
            for_each = trust_store.value.intermediate_cas
            content {
              pem_certificate = intermediate_cas.value.pem_certificate
            }
          }

          dynamic "trust_anchors" {
            for_each = trust_store.value.trust_anchors
            content {
              pem_certificate = trust_anchors.value.pem_certificate
            }
          }

        }
      }

    }
  }

}
