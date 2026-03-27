#tftest.hcl
variables {
  region              = "us-east-1"
  env                 = "test"
  schedule_identifier = "master-test-snapshot-schedule-identifier"
  cluster_identifier  = "master-test-redshift-cluster"
}

run "validate" {
  command = plan
  assert {
    condition     = aws_redshift_snapshot_schedule_association.this.schedule_identifier == "master-test-snapshot-schedule-identifier"
    error_message = "Redshift cluster snapshot schedule identifier is not correct"
  }
}