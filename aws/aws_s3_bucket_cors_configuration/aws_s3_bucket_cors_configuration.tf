resource "aws_s3_bucket_cors_configuration" "this" {
  bucket = var.bucket

  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_headers = cors_rule.value["allowed_headers"]
      allowed_methods = cors_rule.value["allowed_methods"]
      allowed_origins = cors_rule.value["allowed_origins"]
      max_age_seconds = cors_rule.value["max_age_seconds"]
      expose_headers  = cors_rule.value["expose_headers"]
    }
  }
}