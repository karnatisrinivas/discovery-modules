data "aws_redshift_orderable_cluster" "this" {

  preferred_node_types = var.preferred_node_types
}
