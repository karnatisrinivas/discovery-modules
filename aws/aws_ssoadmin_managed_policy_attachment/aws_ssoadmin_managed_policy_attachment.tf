resource "aws_ssoadmin_managed_policy_attachment" "this" {
  instance_arn       = var.instance_arn
  managed_policy_arn = var.managed_policy_arn
  permission_set_arn = var.permission_set_arn

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = try(timeouts.value.create, null) != null && try(timeouts.value.create, null) != "" ? try(timeouts.value.create, null) : null
      delete = try(timeouts.value.delete, null) != null && try(timeouts.value.delete, null) != "" ? try(timeouts.value.delete, null) : null
    }
  }
}
