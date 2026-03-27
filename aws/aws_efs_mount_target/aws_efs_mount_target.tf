resource "aws_efs_mount_target" "this" {
  file_system_id  = var.file_system_id
  ip_address      = var.ip_address
  security_groups = var.security_groups
  subnet_id       = var.subnet_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
