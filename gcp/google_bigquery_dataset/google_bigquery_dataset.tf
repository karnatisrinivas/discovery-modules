resource "google_bigquery_dataset" "this" {
  dataset_id                      = var.dataset_id
  default_collation               = var.default_collation
  default_partition_expiration_ms = var.default_partition_expiration_ms
  default_table_expiration_ms     = var.default_table_expiration_ms == 0 ? null : var.default_table_expiration_ms
  delete_contents_on_destroy      = var.delete_contents_on_destroy
  description                     = var.description
  friendly_name                   = var.friendly_name
  is_case_insensitive             = var.is_case_insensitive
  labels                          = var.labels
  location                        = var.location
  max_time_travel_hours           = var.max_time_travel_hours
  resource_tags                   = var.resource_tags
  storage_billing_model           = var.storage_billing_model

  dynamic "access" {
    for_each = var.access
    content {
      domain         = access.value.domain
      group_by_email = access.value.group_by_email
      iam_member     = access.value.iam_member
      role           = access.value.role
      special_group  = access.value.special_group
      user_by_email  = access.value.user_by_email

      dynamic "condition" {
        for_each = access.value.condition
        content {
          description = condition.value.description
          expression  = condition.value.expression
          location    = condition.value.location
          title       = condition.value.title
        }
      }

      dynamic "dataset" {
        for_each = access.value.dataset
        content {
          target_types = dataset.value.target_types

          dynamic "dataset" {
            for_each = dataset.value.dataset
            content {
              dataset_id = dataset.value.dataset_id
              project_id = dataset.value.project_id
            }
          }

        }
      }

      dynamic "routine" {
        for_each = access.value.routine
        content {
          dataset_id = routine.value.dataset_id
          project_id = routine.value.project_id
          routine_id = routine.value.routine_id
        }
      }

      dynamic "view" {
        for_each = access.value.view
        content {
          dataset_id = view.value.dataset_id
          project_id = view.value.project_id
          table_id   = view.value.table_id
        }
      }

    }
  }

  dynamic "default_encryption_configuration" {
    for_each = var.default_encryption_configuration
    content {
      kms_key_name = default_encryption_configuration.value.kms_key_name
    }
  }

  dynamic "external_dataset_reference" {
    for_each = var.external_dataset_reference
    content {
      connection      = external_dataset_reference.value.connection
      external_source = external_dataset_reference.value.external_source
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
