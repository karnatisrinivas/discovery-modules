#tftest.hcl
variables {
  region                             = "us-west-2"
  cluster_identifier                 = "example-rds-cluster"
  engine                             = "aurora-postgresql"
  availability_zones                 = null
  backup_retention_period            = 7
  database_name                      = "testrdsdb"
  db_subnet_group_name               = null
  engine_mode                        = "provisioned"
  engine_version                     = "13.12"
  master_password                    = "testpwdUser"
  master_username                    = "testuser"
  preferred_backup_window            = null
  preferred_maintenance_window       = null
  storage_encrypted                  = true
  vpc_security_group_ids             = null
  kms_key_id                         = null
  enable_global_write_forwarding     = false
  enable_local_write_forwarding      = false
  global_cluster_identifier          = null
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = true
  copy_tags_to_snapshot              = false
  enabled_cloudwatch_logs_exports    = []
  tags = {
    Environment = "dev"
    Terraform   = "True"
  }
}

run "validate" {

  command = apply

  assert {
    condition     = aws_rds_cluster.this.cluster_identifier == "example-rds-cluster"
    error_message = "cluster name is not correct"
  }
}
