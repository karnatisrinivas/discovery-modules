resource "google_vpc_access_connector" "this" {
  ip_cidr_range  = var.ip_cidr_range
  machine_type   = var.machine_type
  max_instances  = var.max_instances
  max_throughput = var.max_throughput
  min_instances  = var.min_instances
  min_throughput = var.min_throughput
  name           = var.name
  network        = var.network

  dynamic "subnet" {
    for_each = var.subnet
    content {
      name       = subnet.value.name
      project_id = subnet.value.project_id
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
