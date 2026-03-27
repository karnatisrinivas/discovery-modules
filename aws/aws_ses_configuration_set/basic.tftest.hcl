variables {
  region                     = "us-east-1"
  name                       = "test"
  reputation_metrics_enabled = true
  sending_enabled            = true
  tracking_options = [{
    custom_redirect_domain = "example.com"
  }]
  delivery_options = [{
    tls_policy = "Optional"
  }]
}

run "test" {
  command = plan
  assert {
    condition     = aws_ses_configuration_set.this.name == "test"
    error_message = "The test for aws_ses_configuration_set did not pass"
  }
}
