data "aws_rds_certificate" "this" {

  latest_valid_till = var.latest_valid_till
}
