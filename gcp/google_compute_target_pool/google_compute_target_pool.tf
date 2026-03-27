resource "google_compute_target_pool" "this" {
  backup_pool      = var.backup_pool
  description      = var.description
  failover_ratio   = var.failover_ratio
  health_checks    = var.health_checks
  instances        = var.instances
  name             = var.name
  session_affinity = var.session_affinity

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
