variables {
  identifier   = "https://example.com"
  name         = "example_cognito_resource"
  user_pool_id = "thisisauserpoolid"
  scope = [
    {
      scope_name        = "sample_scope"
      scope_description = "A sample scope description"
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_cognito_resource_server.this.name == "example_cognito_resource"
    error_message = "Test for AWS Cognito Resource Server did not pass."
  }
}