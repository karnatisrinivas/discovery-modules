resource "aws_acm_certificate" "this" {
  certificate_authority_arn = var.certificate_authority_arn
  certificate_body          = var.certificate_body
  certificate_chain         = var.certificate_chain
  domain_name               = var.domain_name
  early_renewal_duration    = var.early_renewal_duration
  key_algorithm             = var.key_algorithm
  private_key               = var.private_key
  subject_alternative_names = var.subject_alternative_names
  tags                      = var.tags
  validation_method         = var.validation_method

  dynamic "options" {
    for_each = var.options
    content {
      certificate_transparency_logging_preference = options.value.certificate_transparency_logging_preference
    }
  }

  dynamic "validation_option" {
    for_each = var.validation_option
    content {
      domain_name       = validation_option.value.domain_name
      validation_domain = validation_option.value.validation_domain
    }
  }

}
