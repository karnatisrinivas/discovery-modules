data "aws_msk_bootstrap_brokers" "this" {
  cluster_arn = var.cluster_arn
}
