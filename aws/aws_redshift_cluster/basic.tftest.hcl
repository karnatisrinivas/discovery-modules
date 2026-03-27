#tftest.hcl
variables {
  region                               = "us-east-1"
  env                                  = "test"
  cluster_identifier                   = "master-test-redshift-cluster"
  node_type                            = "dc2.large"
  database_name                        = "test_db"
  cluster_type                         = "single-node"
  master_username                      = "mastertestuser"
  vpc_security_group_ids               = null
  availability_zone                    = null
  availability_zone_relocation_enabled = false
  preferred_maintenance_window         = null
  automated_snapshot_retention_period  = 1
  port                                 = 5439
  cluster_version                      = null
  allow_version_upgrade                = false
  apply_immediately                    = false
  number_of_nodes                      = 1
  encrypted                            = true
  enhanced_vpc_routing                 = true
  elastic_ip                           = null
  skip_final_snapshot                  = true
  final_snapshot_identifier            = "delete-before"
  enable_logging                       = true
  maintenance_track_name               = "current"
  manual_snapshot_retention_period     = 1
  iam_roles                            = null
  cluster_subnet_group_name            = "test-subnet-grp"
  secret_encryption_use_custom_kms_key = true
  manage_master_password               = true
  publicly_accessible                  = false
  kms_key_id                           = null
  tags                                 = null
  master_password_secret_kms_key_id    = null
}

run "validate" {
  command = plan
  assert {
    condition     = aws_redshift_cluster.this.cluster_identifier == "master-test-redshift-cluster"
    error_message = "Redshift cluster identifier is not correct"
  }
}