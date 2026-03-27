variables {
  region         = "us-east-2"
  env            = "test"
  domain_name    = "test-domain"
  engine_version = "OpenSearch_2.9"
  tags           = null
  domain_endpoint_options = [{
    custom_endpoint     = null
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }]
  log_publishing_options = [{
    cloudwatch_log_group_arn = "arn:aws:elasticloadbalancing:us-east-2:123456789012:targetgroup/test-tg/644b6b8d5a1c2f7f"
    enabled                  = false
    log_type                 = "ES_APPLICATION_LOGS"
  }]
  encrypt_at_rest = [{
    kms_key_id = null
    enabled    = false
  }]
  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
  ebs_options = [{
    ebs_enabled = false
    volume_size = 1
    volume_type = null
  }]
  vpc_options = [{
    security_group_ids = null
    subnet_ids         = null
  }]
}

run "validate" {

  command = plan
  assert {
    condition     = aws_opensearch_domain.this.domain_name == "test-domain"
    error_message = "OpenSearch domain name is not correct"
  }

}
