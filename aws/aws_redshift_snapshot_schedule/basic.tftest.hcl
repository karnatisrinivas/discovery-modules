#tftest.hcl
variables {
  region      = "us-east-1"
  env         = "test"
  identifier  = "master-test-snapshot-schedule-identifier"
  definitions = ["rate(12 hours)"]
  tags        = null
}

run "validate" {
  command = plan
  assert {
    condition     = aws_redshift_snapshot_schedule.this.identifier == "master-test-snapshot-schedule-identifier"
    error_message = "Redshift cluster snapshot schedule identifier is not correct"
  }
}