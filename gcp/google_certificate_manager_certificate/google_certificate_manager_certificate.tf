resource "google_certificate_manager_certificate" "this" {
  description = var.description
  labels      = var.labels
  location    = var.location
  name        = var.name
  scope       = var.scope

  dynamic "managed" {
    for_each = var.managed
    content {
      dns_authorizations = managed.value.dns_authorizations
      domains            = managed.value.domains
      issuance_config    = managed.value.issuance_config
    }
  }

  dynamic "self_managed" {
    for_each = var.self_managed
    content {
      certificate_pem = self_managed.value.certificate_pem
      pem_certificate = self_managed.value.pem_certificate
      pem_private_key = self_managed.value.pem_private_key
      private_key_pem = self_managed.value.private_key_pem
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
