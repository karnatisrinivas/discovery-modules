data "aws_redshift_producer_data_shares" "this" {
  producer_arn = var.producer_arn

  status = var.status
}
