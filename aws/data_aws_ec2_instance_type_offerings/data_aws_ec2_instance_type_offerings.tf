data "aws_ec2_instance_type_offerings" "this" {

  location_type = var.location_type
}
