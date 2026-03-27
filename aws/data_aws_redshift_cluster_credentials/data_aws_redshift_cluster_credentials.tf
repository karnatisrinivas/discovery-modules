data "aws_redshift_cluster_credentials" "this" {
  cluster_identifier = var.cluster_identifier
  db_user            = var.db_user

  auto_create      = var.auto_create
  db_groups        = var.db_groups
  db_name          = var.db_name
  duration_seconds = var.duration_seconds
}
