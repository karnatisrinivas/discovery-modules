data "aws_redshift_cluster" "this" {
  cluster_identifier = var.cluster_identifier
}
