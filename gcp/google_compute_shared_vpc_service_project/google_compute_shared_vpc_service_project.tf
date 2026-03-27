resource "google_compute_shared_vpc_service_project" "this" {
  deletion_policy = var.deletion_policy
  host_project    = var.host_project
  service_project = var.service_project

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
