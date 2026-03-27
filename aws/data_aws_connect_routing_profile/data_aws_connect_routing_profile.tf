data "aws_connect_routing_profile" "this" {
  instance_id        = var.instance_id
  routing_profile_id = var.routing_profile_id
  name               = var.name
}
