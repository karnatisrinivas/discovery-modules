resource "aws_alb_listener" "this" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol
  tags              = var.tags
  certificate_arn   = var.certificate_arn != "" ? var.certificate_arn : null
  dynamic "default_action" {
    for_each = var.default_action != null ? var.default_action : []
    content {
      type             = default_action.value.type == "" ? null : default_action.value.type
      target_group_arn = default_action.value.target_group_arn == "" ? null : default_action.value.target_group_arn
      order            = default_action.value.order == 0 ? null : default_action.value.order

      dynamic "redirect" {
        for_each = default_action.value.redirect != null && length(default_action.value.redirect) > 0 ? default_action.value.redirect : []
        content {
          host        = redirect.value.host == "" ? null : redirect.value.host
          path        = redirect.value.path == "" ? null : redirect.value.path
          port        = redirect.value.port == "" ? null : redirect.value.port
          protocol    = redirect.value.protocol == "" ? null : redirect.value.protocol
          query       = redirect.value.query == "" ? null : redirect.value.query
          status_code = redirect.value.status_code == "" ? null : redirect.value.status_code
        }
      }

      dynamic "fixed_response" {
        for_each = default_action.value.fixed_response != null && length(default_action.value.fixed_response) > 0 ? default_action.value.fixed_response : []
        content {
          content_type = fixed_response.value.content_type == "" ? null : fixed_response.value.content_type
          message_body = fixed_response.value.message_body == "" ? null : fixed_response.value.message_body
          status_code  = fixed_response.value.status_code == "" ? null : fixed_response.value.status_code
        }
      }
    }
  }
}


