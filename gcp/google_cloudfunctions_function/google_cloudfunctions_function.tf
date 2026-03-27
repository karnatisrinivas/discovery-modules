resource "google_cloudfunctions_function" "this" {
  available_memory_mb           = var.available_memory_mb
  build_environment_variables   = var.build_environment_variables
  build_service_account         = var.build_service_account
  build_worker_pool             = var.build_worker_pool
  description                   = var.description
  docker_registry               = var.docker_registry
  docker_repository             = var.docker_repository
  entry_point                   = var.entry_point
  environment_variables         = var.environment_variables
  https_trigger_security_level  = var.https_trigger_security_level
  https_trigger_url             = var.https_trigger_url
  ingress_settings              = var.ingress_settings
  kms_key_name                  = var.kms_key_name
  labels                        = var.labels
  max_instances                 = var.max_instances
  min_instances                 = var.min_instances
  name                          = var.name
  runtime                       = var.runtime
  service_account_email         = var.service_account_email
  source_archive_bucket         = var.source_archive_bucket
  source_archive_object         = var.source_archive_object
  timeout                       = var.timeout
  trigger_http                  = var.trigger_http
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = var.vpc_connector_egress_settings == "" ? null : var.vpc_connector_egress_settings

  dynamic "event_trigger" {
    for_each = var.event_trigger
    content {
      event_type = event_trigger.value.event_type
      resource   = event_trigger.value.resource

      dynamic "failure_policy" {
        for_each = event_trigger.value.failure_policy
        content {
          retry = failure_policy.value.retry
        }
      }

    }
  }

  dynamic "secret_environment_variables" {
    for_each = var.secret_environment_variables
    content {
      key        = secret_environment_variables.value.key
      project_id = secret_environment_variables.value.project_id
      secret     = secret_environment_variables.value.secret
      version    = secret_environment_variables.value.version
    }
  }

  dynamic "secret_volumes" {
    for_each = var.secret_volumes
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

  dynamic "source_repository" {
    for_each = var.source_repository
    content {
      url = source_repository.value.url
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
