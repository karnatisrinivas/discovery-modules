data "aws_ec2_spot_price" "this" {

  availability_zone = var.availability_zone
  instance_type     = var.instance_type
}
