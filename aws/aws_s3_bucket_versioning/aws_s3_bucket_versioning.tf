resource "aws_s3_bucket_versioning" "this" {
  bucket = var.bucket

  dynamic "versioning_configuration" {
    for_each = var.versioning_configuration
    content {
      status     = versioning_configuration.value.status
      mfa_delete = versioning_configuration.value.mfa_delete != null && versioning_configuration.value.mfa_delete != "" ? versioning_configuration.value.mfa_delete : null
    }
  }

  mfa = var.mfa
}