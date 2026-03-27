# database resource
resource "aws_athena_database" "this" {
  name   = var.name
  bucket = var.bucket
  dynamic "acl_configuration" {
    for_each = var.acl_configuration
    content {
      s3_acl_option = acl_configuration.value.s3_acl_option
    }
  }

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration
    content {
      encryption_option = encryption_configuration.value.encryption_option
      kms_key           = encryption_configuration.value.kms_key
    }
  }

  expected_bucket_owner = var.expected_bucket_owner
  force_destroy         = var.force_destroy
}

