#tftest.hcl
variables {
  secret_id      = "tftest_example_secret"
  env            = "dev"
  region         = "us-east-1"
  secret_string  = "some_example_value"
  version_stages = null
}

run "validate" {

  command = plan
  assert {
    condition     = aws_secretsmanager_secret_version.this.secret_id == "tftest_example_secret"
    error_message = "secretsmanager secret name is not correct"
  }
}
