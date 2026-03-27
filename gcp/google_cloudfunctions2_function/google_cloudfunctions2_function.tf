resource "google_cloudfunctions2_function" "this" {
  description  = var.description
  kms_key_name = var.kms_key_name
  labels       = var.labels
  location     = var.location
  name         = var.name

  dynamic "build_config" {
    for_each = var.build_config
    content {
      docker_repository     = build_config.value.docker_repository
      entry_point           = build_config.value.entry_point
      environment_variables = build_config.value.environment_variables
      runtime               = build_config.value.runtime
      service_account       = build_config.value.service_account
      worker_pool           = build_config.value.worker_pool

      dynamic "automatic_update_policy" {
        for_each = build_config.value.automatic_update_policy
        content {
        }
      }

      dynamic "on_deploy_update_policy" {
        for_each = build_config.value.on_deploy_update_policy
        content {
        }
      }

      dynamic "source" {
        for_each = build_config.value.source
        content {
          dynamic "repo_source" {
            for_each = source.value.repo_source
            content {
              branch_name  = repo_source.value.branch_name
              commit_sha   = repo_source.value.commit_sha
              dir          = repo_source.value.dir
              invert_regex = repo_source.value.invert_regex
              project_id   = repo_source.value.project_id
              repo_name    = repo_source.value.repo_name
              tag_name     = repo_source.value.tag_name
            }
          }

          dynamic "storage_source" {
            for_each = source.value.storage_source
            content {
              bucket     = storage_source.value.bucket
              generation = storage_source.value.generation
              object     = storage_source.value.object
            }
          }

        }
      }

    }
  }

  dynamic "event_trigger" {
    for_each = var.event_trigger
    content {
      event_type            = event_trigger.value.event_type
      pubsub_topic          = event_trigger.value.pubsub_topic
      retry_policy          = event_trigger.value.retry_policy
      service_account_email = event_trigger.value.service_account_email
      trigger_region        = event_trigger.value.trigger_region

      dynamic "event_filters" {
        for_each = event_trigger.value.event_filters
        content {
          attribute = event_filters.value.attribute
          operator  = event_filters.value.operator
          value     = event_filters.value.value
        }
      }

    }
  }

  dynamic "service_config" {
    for_each = var.service_config
    content {
      all_traffic_on_latest_revision   = service_config.value.all_traffic_on_latest_revision
      available_cpu                    = service_config.value.available_cpu
      available_memory                 = service_config.value.available_memory
      binary_authorization_policy      = service_config.value.binary_authorization_policy
      environment_variables            = service_config.value.environment_variables
      ingress_settings                 = service_config.value.ingress_settings
      max_instance_count               = service_config.value.max_instance_count
      max_instance_request_concurrency = service_config.value.max_instance_request_concurrency
      min_instance_count               = service_config.value.min_instance_count
      service                          = service_config.value.service
      service_account_email            = service_config.value.service_account_email
      timeout_seconds                  = service_config.value.timeout_seconds
      vpc_connector                    = service_config.value.vpc_connector
      vpc_connector_egress_settings    = service_config.value.vpc_connector_egress_settings

      dynamic "secret_environment_variables" {
        for_each = service_config.value.secret_environment_variables
        content {
          key        = secret_environment_variables.value.key
          project_id = secret_environment_variables.value.project_id
          secret     = secret_environment_variables.value.secret
          version    = secret_environment_variables.value.version
        }
      }

      dynamic "secret_volumes" {
        for_each = service_config.value.secret_volumes
        content {
          mount_path = secret_volumes.value.mount_path
          project_id = secret_volumes.value.project_id
          secret     = secret_volumes.value.secret

          dynamic "versions" {
            for_each = secret_volumes.value.versions
            content {
              path    = versions.value.path
              version = versions.value.version
            }
          }

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

}
