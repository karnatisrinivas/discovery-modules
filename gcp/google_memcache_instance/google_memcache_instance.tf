resource "google_memcache_instance" "this" {
  name               = var.name
  authorized_network = var.authorized_network

  labels = var.labels

  node_config {
    cpu_count      = var.cpu_count
    memory_size_mb = var.memory_size_mb
  }
  node_count       = var.node_count
  memcache_version = var.memcache_version

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy
    content {
      weekly_maintenance_window {
        day      = maintenance_policy.value.day
        duration = "${maintenance_policy.value.duration}s"
        dynamic "start_time" {
          for_each = maintenance_policy.value.hours != null || maintenance_policy.value.minutes != null || maintenance_policy.value.seconds != null || maintenance_policy.value.nanos != null ? [1] : []
          content {
            hours   = maintenance_policy.value.hours
            minutes = maintenance_policy.value.minutes
            seconds = maintenance_policy.value.seconds
            nanos   = maintenance_policy.value.nanos
          }
        }

        #We need atleast one start_time block
        dynamic "start_time" {
          for_each = maintenance_policy.value.hours == null && maintenance_policy.value.minutes == null && maintenance_policy.value.seconds == null && maintenance_policy.value.nanos == null ? [1] : []
          content {
            hours   = 0
            minutes = 0
            seconds = 0
            nanos   = 0
          }
        }
      }
    }
  }
}