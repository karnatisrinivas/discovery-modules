resource "google_apigee_endpoint_attachment" "this" {
  endpoint_attachment_id = var.endpoint_attachment_id
  location               = var.location
  org_id                 = var.org_id
  service_attachment     = var.service_attachment

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
