resource "aws_redshift_cluster" "this" {
  cluster_identifier                   = var.cluster_identifier
  node_type                            = var.node_type
  database_name                        = var.database_name
  cluster_type                         = var.cluster_type
  master_username                      = var.master_username
  manage_master_password               = var.manage_master_password
  master_password_secret_kms_key_id    = var.master_password_secret_kms_key_id
  vpc_security_group_ids               = var.vpc_security_group_ids
  cluster_subnet_group_name            = var.cluster_subnet_group_name
  availability_zone                    = var.availability_zone
  availability_zone_relocation_enabled = var.availability_zone_relocation_enabled
  preferred_maintenance_window         = var.preferred_maintenance_window
  automated_snapshot_retention_period  = var.automated_snapshot_retention_period
  port                                 = var.port
  cluster_version                      = var.cluster_version
  allow_version_upgrade                = var.allow_version_upgrade
  apply_immediately                    = var.apply_immediately
  number_of_nodes                      = var.number_of_nodes
  publicly_accessible                  = var.publicly_accessible
  enhanced_vpc_routing                 = var.enhanced_vpc_routing
  encrypted                            = var.encrypted
  kms_key_id                           = var.kms_key_id
  elastic_ip                           = var.elastic_ip


  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier

  iam_roles = var.iam_roles


  maintenance_track_name           = var.maintenance_track_name
  manual_snapshot_retention_period = var.manual_snapshot_retention_period

  tags = var.tags
}




