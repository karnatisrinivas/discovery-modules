variables {
  name                = "example_rule"
  env                 = "dev"
  region              = "us-west-2"
  description         = "some description"
  schedule_expression = "rate(5 minutes)"
  event_pattern       = null
  event_bus_name      = "test"
  role_arn            = null
  state               = "ENABLED"
  tags                = null
}

run "validate" {
  command = plan
  assert {
    condition     = aws_cloudwatch_event_rule.this.name == "example_rule"
    error_message = "cloudwatch_event_rule name is not correct"
  }

}
