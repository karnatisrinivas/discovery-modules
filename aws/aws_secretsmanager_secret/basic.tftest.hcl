#tftest.hcl
variables {
  name                    = "tftest_example_secret"
  env                     = "dev"
  region                  = "us-east-1"
  description             = null
  recovery_window_in_days = 0
  kms_key_id              = null
  tags                    = null
}

run "validate" {

  command = plan
  assert {
    condition     = aws_secretsmanager_secret.this.name == "tftest_example_secret"
    error_message = "secretsmanager secret name is not correct"
  }

  assert {
    condition     = aws_secretsmanager_secret.this.recovery_window_in_days == 0
    error_message = "secretsmanager secret name is not correct"
  }

}
