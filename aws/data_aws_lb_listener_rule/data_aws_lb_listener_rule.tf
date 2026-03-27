data "aws_lb_listener_rule" "this" {
  arn          = var.arn
  listener_arn = var.listener_arn
}
