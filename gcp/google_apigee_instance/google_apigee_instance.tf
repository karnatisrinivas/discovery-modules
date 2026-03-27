resource "google_apigee_instance" "this" {
  consumer_accept_list     = var.consumer_accept_list
  description              = var.description
  disk_encryption_key_name = var.disk_encryption_key_name
  display_name             = var.display_name
  ip_range                 = var.ip_range
  location                 = var.location
  name                     = var.name
  org_id                   = var.org_id
  peering_cidr_range       = var.peering_cidr_range

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
