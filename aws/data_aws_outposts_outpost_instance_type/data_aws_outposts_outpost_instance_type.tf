data "aws_outposts_outpost_instance_type" "this" {
  arn = var.arn

  preferred_instance_types = var.preferred_instance_types
}
