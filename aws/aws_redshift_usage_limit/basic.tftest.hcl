#tftest.hcl
variables {
  region             = "us-east-1"
  env                = "test"
  cluster_identifier = "master-test-redshift-cluster"
  amount             = 60
  feature_type       = "concurrency-scaling"
  limit_type         = "time"
  period             = "monthly"
  breach_action      = "log"
  tags               = {}
}

run "validate" {
  command = plan
  assert {
    condition     = aws_redshift_usage_limit.this.cluster_identifier == "master-test-redshift-cluster"
    error_message = "Redshift usage cluster identifier is not correct"
  }
}