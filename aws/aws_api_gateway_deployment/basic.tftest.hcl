variables {
  region            = "us-east-1"
  stage_description = "somedescription"
  stage_name        = "somename"
  triggers = {
    "sometrigger" = "somevalue"
  }
  variables = {
    "somevariable" = "somevalue"
  }
  description = "somedescription"
  rest_api_id = "someid"
}
run "test" {
  command = plan
  assert {
    condition     = aws_api_gateway_deployment.this.stage_name != null
    error_message = "aws_api_gateway_deployment was not succesful"
  }
}
