# workgroup resource
resource "aws_athena_workgroup" "this" {
  name          = var.name
  description   = var.description
  state         = var.state
  force_destroy = var.force_destroy
  tags          = var.tags

  dynamic "configuration" {
    for_each = var.configuration
    content {
      requester_pays_enabled          = configuration.value.requester_pays_enabled
      bytes_scanned_cutoff_per_query  = configuration.value.bytes_scanned_cutoff_per_query
      enforce_workgroup_configuration = configuration.value.enforce_workgroup_configuration
      dynamic "engine_version" {
        for_each = configuration.value.engine_version
        content {
          selected_engine_version = engine_version.value.selected_engine_version
        }
      }
      execution_role                     = configuration.value.execution_role
      publish_cloudwatch_metrics_enabled = configuration.value.publish_cloudwatch_metrics_enabled
      dynamic "result_configuration" {
        for_each = configuration.value.result_configuration
        content {
          dynamic "encryption_configuration" {
            for_each = result_configuration.value.encryption_configuration
            content {
              encryption_option = encryption_configuration.value.encryption_option
              kms_key_arn       = encryption_configuration.value.kms_key_arn
            }
          }
          dynamic "acl_configuration" {
            for_each = result_configuration.value.acl_configuration
            content {
              s3_acl_option = acl_configuration.value.s3_acl_option
            }
          }
          output_location       = result_configuration.value.output_location
          expected_bucket_owner = result_configuration.value.expected_bucket_owner
        }
      }
    }
  }
}



