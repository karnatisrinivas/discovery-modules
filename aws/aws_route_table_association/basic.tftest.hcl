variables {
  route_table_id = "arn:partition:service:region:account-id:resource-type:resource-id"
  gateway_id     = "arn:partition:service:region:account-id:resource-type:resource-id"
  subnet_id      = null
}

run "test" {
  command = plan
  assert {
    condition     = aws_route_table_association.this.route_table_id == "arn:partition:service:region:account-id:resource-type:resource-id"
    error_message = "The test for AWS Route Table Association did not pass"
  }
}