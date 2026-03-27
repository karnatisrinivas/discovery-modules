resource "aws_signer_signing_profile" "this" {
  name        = var.name
  name_prefix = var.name_prefix
  platform_id = var.platform_id
  tags        = var.tags

  dynamic "signature_validity_period" {
    for_each = var.signature_validity_period
    content {
      type  = signature_validity_period.value.type
      value = signature_validity_period.value.value
    }
  }

  dynamic "signing_material" {
    for_each = var.signing_material
    content {
      certificate_arn = signing_material.value.certificate_arn
    }
  }

}
