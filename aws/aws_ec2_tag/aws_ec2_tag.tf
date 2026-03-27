resource "aws_ec2_tag" "this" {
  key         = var.key
  resource_id = var.resource_id
  value       = var.value

}
