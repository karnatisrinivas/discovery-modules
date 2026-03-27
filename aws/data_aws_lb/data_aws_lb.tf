data "aws_lb" "this" {
  arn  = var.arn
  name = var.name
}
