resource "aws_ecr_repository" "this" {
  name                 = var.name
  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability
  dynamic "image_scanning_configuration" {
    for_each = var.image_scanning_configuration
    content {
      scan_on_push = image_scanning_configuration.value.scan_on_push
    }
  }
  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration != null ? var.encryption_configuration : []
    content {
      encryption_type = encryption_configuration.value.encryption_type
      kms_key         = encryption_configuration.value.kms_key
    }
  }
  tags = var.tags
}






