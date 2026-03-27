resource "aws_opensearch_domain" "this" {
  domain_name    = var.domain_name
  engine_version = var.engine_version



  dynamic "encrypt_at_rest" {
    for_each = var.encrypt_at_rest
    content {
      enabled    = encrypt_at_rest.value.enabled
      kms_key_id = encrypt_at_rest.value.kms_key_id
    }
  }

  advanced_options = var.advanced_options

  dynamic "domain_endpoint_options" {
    for_each = var.domain_endpoint_options
    content {
      enforce_https       = domain_endpoint_options.value.enforce_https
      tls_security_policy = domain_endpoint_options.value.tls_security_policy
      custom_endpoint     = domain_endpoint_options.value.custom_endpoint
    }

  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options
    content {
      cloudwatch_log_group_arn = log_publishing_options.value.cloudwatch_log_group_arn
      enabled                  = log_publishing_options.value.enabled
      log_type                 = log_publishing_options.value.log_type
    }

  }

  dynamic "vpc_options" {
    for_each = var.vpc_options
    content {
      subnet_ids         = vpc_options.value.subnet_ids
      security_group_ids = vpc_options.value.security_group_ids
    }
  }

  dynamic "ebs_options" {
    for_each = var.ebs_options
    content {
      ebs_enabled = ebs_options.value.ebs_enabled
      volume_size = ebs_options.value.volume_size
      volume_type = ebs_options.value.volume_type
    }
  }
  tags = var.tags
}




