variables {
  vpc_id              = "this.is.an.id"
  internet_gateway_id = "this.is.another.id"
}

run "test" {
  command = plan
  assert {
    condition     = aws_internet_gateway_attachment.this.vpc_id == "this.is.an.id"
    error_message = "The test for AWS Internet Gateway Attachment did not pass."
  }
}