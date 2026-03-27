data "aws_msk_cluster" "this" {
  cluster_name = var.cluster_name
}
