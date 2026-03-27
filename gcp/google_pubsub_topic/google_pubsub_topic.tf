resource "google_pubsub_topic" "this" {
  kms_key_name               = var.kms_key_name
  labels                     = var.labels
  message_retention_duration = var.message_retention_duration
  name                       = var.name

  dynamic "ingestion_data_source_settings" {
    for_each = var.ingestion_data_source_settings
    content {
      dynamic "aws_kinesis" {
        for_each = ingestion_data_source_settings.value.aws_kinesis
        content {
          aws_role_arn        = aws_kinesis.value.aws_role_arn
          consumer_arn        = aws_kinesis.value.consumer_arn
          gcp_service_account = aws_kinesis.value.gcp_service_account
          stream_arn          = aws_kinesis.value.stream_arn
        }
      }

      dynamic "aws_msk" {
        for_each = ingestion_data_source_settings.value.aws_msk
        content {
          aws_role_arn        = aws_msk.value.aws_role_arn
          cluster_arn         = aws_msk.value.cluster_arn
          gcp_service_account = aws_msk.value.gcp_service_account
          topic               = aws_msk.value.topic
        }
      }

      dynamic "azure_event_hubs" {
        for_each = ingestion_data_source_settings.value.azure_event_hubs
        content {
          client_id           = azure_event_hubs.value.client_id
          event_hub           = azure_event_hubs.value.event_hub
          gcp_service_account = azure_event_hubs.value.gcp_service_account
          namespace           = azure_event_hubs.value.namespace
          resource_group      = azure_event_hubs.value.resource_group
          subscription_id     = azure_event_hubs.value.subscription_id
          tenant_id           = azure_event_hubs.value.tenant_id
        }
      }

      dynamic "cloud_storage" {
        for_each = ingestion_data_source_settings.value.cloud_storage
        content {
          bucket                     = cloud_storage.value.bucket
          match_glob                 = cloud_storage.value.match_glob
          minimum_object_create_time = cloud_storage.value.minimum_object_create_time

          dynamic "avro_format" {
            for_each = cloud_storage.value.avro_format
            content {
            }
          }

          dynamic "pubsub_avro_format" {
            for_each = cloud_storage.value.pubsub_avro_format
            content {
            }
          }

          dynamic "text_format" {
            for_each = cloud_storage.value.text_format
            content {
              delimiter = text_format.value.delimiter
            }
          }

        }
      }

      dynamic "confluent_cloud" {
        for_each = ingestion_data_source_settings.value.confluent_cloud
        content {
          bootstrap_server    = confluent_cloud.value.bootstrap_server
          cluster_id          = confluent_cloud.value.cluster_id
          gcp_service_account = confluent_cloud.value.gcp_service_account
          identity_pool_id    = confluent_cloud.value.identity_pool_id
          topic               = confluent_cloud.value.topic
        }
      }

      dynamic "platform_logs_settings" {
        for_each = ingestion_data_source_settings.value.platform_logs_settings
        content {
          severity = platform_logs_settings.value.severity
        }
      }

    }
  }

  dynamic "message_storage_policy" {
    for_each = var.message_storage_policy
    content {
      allowed_persistence_regions = message_storage_policy.value.allowed_persistence_regions
      enforce_in_transit          = message_storage_policy.value.enforce_in_transit
    }
  }

  dynamic "schema_settings" {
    for_each = var.schema_settings
    content {
      encoding = schema_settings.value.encoding
      schema   = schema_settings.value.schema
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

}
