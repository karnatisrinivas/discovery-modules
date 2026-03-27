variables {
  name              = "test-server-certificate"
  name_prefix       = null
  certificate_body  = "test-certificate-body"
  private_key       = "test-private-key"
  certificate_chain = null
  path              = null
  tags              = null
  region            = "us-west-2"
  timeouts = {
    delete = "10m"
  }
}

run "test-server-certificate" {
  command = plan
  assert {
    condition     = aws_iam_server_certificate.this.name == "test-server-certificate"
    error_message = "Expected server certificate name to be test-server-certificate"
  }
}