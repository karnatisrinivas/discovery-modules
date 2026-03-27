data "aws_lb_target_group" "this" {
  arn  = var.arn
  name = var.name
}
