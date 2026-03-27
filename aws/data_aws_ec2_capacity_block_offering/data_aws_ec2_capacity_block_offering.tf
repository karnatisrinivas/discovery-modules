data "aws_ec2_capacity_block_offering" "this" {
  capacity_duration_hours = var.capacity_duration_hours
  instance_count          = var.instance_count
  instance_type           = var.instance_type
}
