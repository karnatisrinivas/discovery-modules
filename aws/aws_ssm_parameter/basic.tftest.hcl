variables {
  name            = "example_param"
  env             = "dev"
  region          = "us-east-1"
  type            = "SecureString"
  value           = "some_example_value"
  data_type       = "text"
  description     = "description"
  allowed_pattern = ""
  key_id          = ""
  tier            = "Standard"
  tags = {
    "test" = "test"
  }
}

run "validate" {

  command = plan
  assert {
    condition     = aws_ssm_parameter.this.name == "example_param"
    error_message = "AWS SSM Parameter name is not correct"
  }
}



