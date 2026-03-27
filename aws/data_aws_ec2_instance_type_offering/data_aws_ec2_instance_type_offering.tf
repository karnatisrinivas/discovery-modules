data "aws_ec2_instance_type_offering" "this" {

  location_type            = var.location_type
  preferred_instance_types = var.preferred_instance_types
}
