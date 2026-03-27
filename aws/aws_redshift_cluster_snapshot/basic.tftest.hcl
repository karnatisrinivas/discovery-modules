#tftest.hcl
variables {
  region                           = "us-east-1"
  env                              = "test"
  cluster_identifier               = "master-test-redshift-cluster"
  manual_snapshot_retention_period = 1
  snapshot_identifier              = "master-test-snapshot-identifier"
  tags                             = null
}

run "validate" {

  command = plan
  assert {
    condition     = aws_redshift_cluster_snapshot.this.snapshot_identifier == "master-test-snapshot-identifier"
    error_message = "Redshift cluster snapshot identifier is not correct"
  }
}