resource "google_compute_project_default_network_tier" "this" {
  network_tier = var.network_tier

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
    }
  }

}
