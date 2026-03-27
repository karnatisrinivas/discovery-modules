variables {
  vpc_id = "this.is.an.id"
  tags   = {}
}

run "test" {
  command = plan
  assert {
    condition     = aws_internet_gateway.this.vpc_id == "this.is.an.id"
    error_message = "The test for AWS Internet Gateway did not pass."
  }
}