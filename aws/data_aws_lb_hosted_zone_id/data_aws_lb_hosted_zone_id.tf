data "aws_lb_hosted_zone_id" "this" {

  load_balancer_type = var.load_balancer_type
  region             = var.region
}
