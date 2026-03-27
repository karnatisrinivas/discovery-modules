variables {
  region = "us-east-1"
  name   = "somename"
  parameters = {
    "someparameter" = "somevalue"
  }
  put_rest_api_mode = "merge"
  tags = {
    "sometag" = "somevalue"
  }
  body             = "somebody"
  fail_on_warnings = false
}
run "test" {
  command = plan
  assert {
    condition     = aws_api_gateway_rest_api.this.name != null
    error_message = "aws_api_gateway_rest_api was not succesful"
  }
}
