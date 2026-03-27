data "aws_route53_zone" "this" {
  name         = var.name
  private_zone = var.private_zone
}
