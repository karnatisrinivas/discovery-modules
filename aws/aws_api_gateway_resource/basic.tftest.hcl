variables {
  region      = "us-east-1"
  path_part   = "somename"
  rest_api_id = "someid"
  parent_id   = "someid"
}
run "test" {
  command = plan
  assert {
    condition     = aws_api_gateway_resource.this.path_part != null
    error_message = "aws_api_gateway_resource was not succesful"
  }
}
