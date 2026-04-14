resource "aws_ssoadmin_permission_set" "this" {
  description      = var.description != null && var.description != "" ? var.description : null
  instance_arn     = var.instance_arn
  name             = var.name
  relay_state      = var.relay_state != null && var.relay_state != "" ? var.relay_state : null
  session_duration = var.session_duration != null && var.session_duration != "" ? var.session_duration : null
  tags             = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      update = try(timeouts.value.update, null) != null && try(timeouts.value.update, null) != "" ? try(timeouts.value.update, null) : null
    }
  }
}
