resource "google_storage_bucket" "this" {
  name          = var.name
  location      = var.location
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.uniform_bucket_level_access
  storage_class               = var.storage_class
  default_event_based_hold    = var.default_event_based_hold
  enable_object_retention     = var.enable_object_retention
  requester_pays              = var.requester_pays
  rpo                         = var.rpo
  public_access_prevention    = var.public_access_prevention
  labels                      = var.labels

  dynamic "autoclass" {
    for_each = var.autoclass

    content {
      enabled                = autoclass.value.enabled
      terminal_storage_class = autoclass.value.terminal_storage_class
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule

    content {
      dynamic "action" {
        for_each = lifecycle_rule.value.action

        content {
          type          = action.value.type
          storage_class = action.value.storage_class
        }
      }

      dynamic "condition" {
        for_each = lifecycle_rule.value.condition

        content {
          age                                     = condition.value.age
          created_before                          = condition.value.created_before
          with_state                              = condition.value.with_state
          matches_storage_class                   = condition.value.matches_storage_class
          matches_prefix                          = condition.value.matches_prefix
          matches_suffix                          = condition.value.matches_suffix
          num_newer_versions                      = condition.value.num_newer_versions
          send_num_newer_versions_if_zero         = condition.value.send_num_newer_versions_if_zero
          custom_time_before                      = condition.value.custom_time_before
          days_since_custom_time                  = condition.value.days_since_custom_time
          send_age_if_zero                        = condition.value.send_age_if_zero
          send_days_since_custom_time_if_zero     = condition.value.send_days_since_custom_time_if_zero
          days_since_noncurrent_time              = condition.value.days_since_noncurrent_time
          send_days_since_noncurrent_time_if_zero = condition.value.send_days_since_noncurrent_time_if_zero
          noncurrent_time_before                  = condition.value.noncurrent_time_before
        }
      }
    }
  }

  dynamic "website" {
    for_each = var.website

    content {
      main_page_suffix = website.value.main_page_suffix
      not_found_page   = website.value.not_found_page
    }

  }
  dynamic "cors" {
    for_each = var.cors

    content {
      origin          = cors.value.origin
      method          = cors.value.method
      response_header = cors.value.response_header
      max_age_seconds = cors.value.max_age_seconds
    }

  }

  dynamic "versioning" {
    for_each = var.versioning

    content {
      enabled = versioning.value.enabled
    }
  }

  dynamic "encryption" {
    for_each = var.encryption

    content {
      default_kms_key_name = encryption.value.default_kms_key_name
    }
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy

    content {
      is_locked        = retention_policy.value.is_locked
      retention_period = retention_policy.value.retention_period
    }
  }

  dynamic "custom_placement_config" {
    for_each = var.custom_placement_config

    content {
      data_locations = custom_placement_config.value.data_locations
    }
  }

  dynamic "soft_delete_policy" {
    for_each = var.soft_delete_policy

    content {
      retention_duration_seconds = soft_delete_policy.value.retention_duration_seconds
    }
  }
}