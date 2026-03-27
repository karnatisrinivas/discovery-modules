resource "aws_efs_file_system" "this" {
  availability_zone_name = var.availability_zone_name == "" ? null : var.availability_zone_name
  creation_token         = var.creation_token
  encrypted              = var.encrypted
  kms_key_id             = var.kms_key_id

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy
    content {
      transition_to_ia                    = lifecycle_policy.value.transition_to_ia == "" ? null : lifecycle_policy.value.transition_to_ia
      transition_to_archive               = lifecycle_policy.value.transition_to_archive == "" ? null : lifecycle_policy.value.transition_to_archive
      transition_to_primary_storage_class = lifecycle_policy.value.transition_to_primary_storage_class == "" ? null : lifecycle_policy.value.transition_to_primary_storage_class
    }
  }

  dynamic "protection" {
    for_each = var.protection
    content {
      replication_overwrite = protection.value.replication_overwrite
    }
  }
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.throughput_mode == "provisioned" ? var.provisioned_throughput_in_mibps : null
  throughput_mode                 = var.throughput_mode
  tags                            = var.tags
}
