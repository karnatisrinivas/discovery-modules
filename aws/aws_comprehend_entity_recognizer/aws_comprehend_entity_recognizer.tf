resource "aws_comprehend_entity_recognizer" "this" {
  data_access_role_arn = var.data_access_role_arn
  language_code        = var.language_code
  model_kms_key_id     = var.model_kms_key_id
  name                 = var.name
  tags                 = var.tags
  version_name         = var.version_name
  version_name_prefix  = var.version_name_prefix
  volume_kms_key_id    = var.volume_kms_key_id

  dynamic "input_data_config" {
    for_each = var.input_data_config
    content {
      data_format = input_data_config.value.data_format

      dynamic "annotations" {
        for_each = input_data_config.value.annotations
        content {
          s3_uri      = annotations.value.s3_uri
          test_s3_uri = annotations.value.test_s3_uri
        }
      }

      dynamic "augmented_manifests" {
        for_each = input_data_config.value.augmented_manifests
        content {
          annotation_data_s3_uri  = augmented_manifests.value.annotation_data_s3_uri
          attribute_names         = augmented_manifests.value.attribute_names
          document_type           = augmented_manifests.value.document_type
          s3_uri                  = augmented_manifests.value.s3_uri
          source_documents_s3_uri = augmented_manifests.value.source_documents_s3_uri
          split                   = augmented_manifests.value.split
        }
      }

      dynamic "documents" {
        for_each = input_data_config.value.documents
        content {
          input_format = documents.value.input_format
          s3_uri       = documents.value.s3_uri
          test_s3_uri  = documents.value.test_s3_uri
        }
      }

      dynamic "entity_list" {
        for_each = input_data_config.value.entity_list
        content {
          s3_uri = entity_list.value.s3_uri
        }
      }

      dynamic "entity_types" {
        for_each = input_data_config.value.entity_types
        content {
          type = entity_types.value.type
        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
    }
  }

}
