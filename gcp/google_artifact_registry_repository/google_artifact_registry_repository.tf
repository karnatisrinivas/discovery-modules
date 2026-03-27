resource "google_artifact_registry_repository" "this" {
  cleanup_policy_dry_run = var.cleanup_policy_dry_run
  description            = var.description
  format                 = var.format
  kms_key_name           = var.kms_key_name
  labels                 = var.labels
  location               = var.location
  mode                   = var.mode
  repository_id          = var.repository_id

  dynamic "cleanup_policies" {
    for_each = var.cleanup_policies
    content {
      action = cleanup_policies.value.action
      id     = cleanup_policies.value.id

      dynamic "condition" {
        for_each = cleanup_policies.value.condition
        content {
          newer_than            = condition.value.newer_than
          older_than            = condition.value.older_than
          package_name_prefixes = condition.value.package_name_prefixes
          tag_prefixes          = condition.value.tag_prefixes
          tag_state             = condition.value.tag_state
          version_name_prefixes = condition.value.version_name_prefixes
        }
      }

      dynamic "most_recent_versions" {
        for_each = cleanup_policies.value.most_recent_versions
        content {
          keep_count            = most_recent_versions.value.keep_count
          package_name_prefixes = most_recent_versions.value.package_name_prefixes
        }
      }

    }
  }

  dynamic "docker_config" {
    for_each = var.docker_config
    content {
      immutable_tags = docker_config.value.immutable_tags
    }
  }

  dynamic "maven_config" {
    for_each = var.maven_config
    content {
      allow_snapshot_overwrites = maven_config.value.allow_snapshot_overwrites
      version_policy            = maven_config.value.version_policy
    }
  }

  dynamic "remote_repository_config" {
    for_each = var.remote_repository_config
    content {
      description                 = remote_repository_config.value.description
      disable_upstream_validation = remote_repository_config.value.disable_upstream_validation

      dynamic "apt_repository" {
        for_each = remote_repository_config.value.apt_repository
        content {
          dynamic "public_repository" {
            for_each = apt_repository.value.public_repository
            content {
              repository_base = public_repository.value.repository_base
              repository_path = public_repository.value.repository_path
            }
          }

        }
      }

      dynamic "common_repository" {
        for_each = remote_repository_config.value.common_repository
        content {
          uri = common_repository.value.uri
        }
      }

      dynamic "docker_repository" {
        for_each = remote_repository_config.value.docker_repository
        content {
          public_repository = docker_repository.value.public_repository

          dynamic "custom_repository" {
            for_each = docker_repository.value.custom_repository
            content {
              uri = custom_repository.value.uri
            }
          }

        }
      }

      dynamic "maven_repository" {
        for_each = remote_repository_config.value.maven_repository
        content {
          public_repository = maven_repository.value.public_repository

          dynamic "custom_repository" {
            for_each = maven_repository.value.custom_repository
            content {
              uri = custom_repository.value.uri
            }
          }

        }
      }

      dynamic "npm_repository" {
        for_each = remote_repository_config.value.npm_repository
        content {
          public_repository = npm_repository.value.public_repository

          dynamic "custom_repository" {
            for_each = npm_repository.value.custom_repository
            content {
              uri = custom_repository.value.uri
            }
          }

        }
      }

      dynamic "python_repository" {
        for_each = remote_repository_config.value.python_repository
        content {
          public_repository = python_repository.value.public_repository

          dynamic "custom_repository" {
            for_each = python_repository.value.custom_repository
            content {
              uri = custom_repository.value.uri
            }
          }

        }
      }

      dynamic "upstream_credentials" {
        for_each = remote_repository_config.value.upstream_credentials
        content {
          dynamic "username_password_credentials" {
            for_each = upstream_credentials.value.username_password_credentials
            content {
              password_secret_version = username_password_credentials.value.password_secret_version
              username                = username_password_credentials.value.username
            }
          }

        }
      }

      dynamic "yum_repository" {
        for_each = remote_repository_config.value.yum_repository
        content {
          dynamic "public_repository" {
            for_each = yum_repository.value.public_repository
            content {
              repository_base = public_repository.value.repository_base
              repository_path = public_repository.value.repository_path
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

  dynamic "virtual_repository_config" {
    for_each = var.virtual_repository_config
    content {
      dynamic "upstream_policies" {
        for_each = virtual_repository_config.value.upstream_policies
        content {
          id         = upstream_policies.value.id
          priority   = upstream_policies.value.priority
          repository = upstream_policies.value.repository
        }
      }

    }
  }

  dynamic "vulnerability_scanning_config" {
    for_each = var.vulnerability_scanning_config
    content {
      enablement_config = vulnerability_scanning_config.value.enablement_config
    }
  }

}
