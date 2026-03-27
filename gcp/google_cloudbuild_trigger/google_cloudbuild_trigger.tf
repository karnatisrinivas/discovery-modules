resource "google_cloudbuild_trigger" "this" {
  description        = var.description
  disabled           = var.disabled
  filename           = var.filename
  filter             = var.filter
  ignored_files      = var.ignored_files
  include_build_logs = var.include_build_logs
  included_files     = var.included_files
  location           = var.location
  name               = var.name
  service_account    = var.service_account
  substitutions      = var.substitutions
  tags               = var.tags

  dynamic "approval_config" {
    for_each = var.approval_config
    content {
      approval_required = approval_config.value.approval_required
    }
  }

  dynamic "bitbucket_server_trigger_config" {
    for_each = var.bitbucket_server_trigger_config
    content {
      bitbucket_server_config_resource = bitbucket_server_trigger_config.value.bitbucket_server_config_resource
      project_key                      = bitbucket_server_trigger_config.value.project_key
      repo_slug                        = bitbucket_server_trigger_config.value.repo_slug

      dynamic "pull_request" {
        for_each = bitbucket_server_trigger_config.value.pull_request
        content {
          branch          = pull_request.value.branch
          comment_control = pull_request.value.comment_control
          invert_regex    = pull_request.value.invert_regex
        }
      }

      dynamic "push" {
        for_each = bitbucket_server_trigger_config.value.push
        content {
          branch       = push.value.branch
          invert_regex = push.value.invert_regex
          tag          = push.value.tag
        }
      }

    }
  }

  dynamic "build" {
    for_each = var.build
    content {
      images        = build.value.images
      logs_bucket   = build.value.logs_bucket
      queue_ttl     = build.value.queue_ttl
      substitutions = build.value.substitutions
      tags          = build.value.tags
      timeout       = build.value.timeout

      dynamic "artifacts" {
        for_each = build.value.artifacts
        content {
          images = artifacts.value.images

          dynamic "maven_artifacts" {
            for_each = artifacts.value.maven_artifacts
            content {
              artifact_id = maven_artifacts.value.artifact_id
              group_id    = maven_artifacts.value.group_id
              path        = maven_artifacts.value.path
              repository  = maven_artifacts.value.repository
              version     = maven_artifacts.value.version
            }
          }

          dynamic "npm_packages" {
            for_each = artifacts.value.npm_packages
            content {
              package_path = npm_packages.value.package_path
              repository   = npm_packages.value.repository
            }
          }

          dynamic "objects" {
            for_each = artifacts.value.objects
            content {
              location = objects.value.location
              paths    = objects.value.paths
            }
          }

          dynamic "python_packages" {
            for_each = artifacts.value.python_packages
            content {
              paths      = python_packages.value.paths
              repository = python_packages.value.repository
            }
          }

        }
      }

      dynamic "available_secrets" {
        for_each = build.value.available_secrets
        content {
          dynamic "secret_manager" {
            for_each = available_secrets.value.secret_manager
            content {
              env          = secret_manager.value.env
              version_name = secret_manager.value.version_name
            }
          }

        }
      }

      dynamic "options" {
        for_each = build.value.options
        content {
          disk_size_gb            = options.value.disk_size_gb
          dynamic_substitutions   = options.value.dynamic_substitutions
          env                     = options.value.env
          log_streaming_option    = options.value.log_streaming_option
          logging                 = options.value.logging
          machine_type            = options.value.machine_type
          requested_verify_option = options.value.requested_verify_option
          secret_env              = options.value.secret_env
          source_provenance_hash  = options.value.source_provenance_hash
          substitution_option     = options.value.substitution_option
          worker_pool             = options.value.worker_pool

          dynamic "volumes" {
            for_each = options.value.volumes
            content {
              name = volumes.value.name
              path = volumes.value.path
            }
          }

        }
      }

      dynamic "secret" {
        for_each = build.value.secret
        content {
          kms_key_name = secret.value.kms_key_name
          secret_env   = secret.value.secret_env
        }
      }

      dynamic "source" {
        for_each = build.value.source
        content {
          dynamic "repo_source" {
            for_each = source.value.repo_source
            content {
              branch_name   = repo_source.value.branch_name
              commit_sha    = repo_source.value.commit_sha
              dir           = repo_source.value.dir
              invert_regex  = repo_source.value.invert_regex
              project_id    = repo_source.value.project_id
              repo_name     = repo_source.value.repo_name
              substitutions = repo_source.value.substitutions
              tag_name      = repo_source.value.tag_name
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

      dynamic "step" {
        for_each = build.value.step
        content {
          allow_exit_codes = step.value.allow_exit_codes
          allow_failure    = step.value.allow_failure
          args             = step.value.args
          dir              = step.value.dir
          entrypoint       = step.value.entrypoint
          env              = step.value.env
          id               = step.value.id
          name             = step.value.name
          script           = step.value.script
          secret_env       = step.value.secret_env
          timeout          = step.value.timeout
          timing           = step.value.timing
          wait_for         = step.value.wait_for

          dynamic "volumes" {
            for_each = step.value.volumes
            content {
              name = volumes.value.name
              path = volumes.value.path
            }
          }

        }
      }

    }
  }

  dynamic "git_file_source" {
    for_each = var.git_file_source
    content {
      bitbucket_server_config  = git_file_source.value.bitbucket_server_config
      github_enterprise_config = git_file_source.value.github_enterprise_config
      path                     = git_file_source.value.path
      repo_type                = git_file_source.value.repo_type
      repository               = git_file_source.value.repository
      revision                 = git_file_source.value.revision
      uri                      = git_file_source.value.uri
    }
  }

  dynamic "github" {
    for_each = var.github
    content {
      enterprise_config_resource_name = github.value.enterprise_config_resource_name
      name                            = github.value.name
      owner                           = github.value.owner

      dynamic "pull_request" {
        for_each = github.value.pull_request
        content {
          branch          = pull_request.value.branch
          comment_control = pull_request.value.comment_control
          invert_regex    = pull_request.value.invert_regex
        }
      }

      dynamic "push" {
        for_each = github.value.push
        content {
          branch       = push.value.branch
          invert_regex = push.value.invert_regex
          tag          = push.value.tag
        }
      }

    }
  }

  dynamic "pubsub_config" {
    for_each = var.pubsub_config
    content {
      service_account_email = pubsub_config.value.service_account_email
      topic                 = pubsub_config.value.topic
    }
  }

  dynamic "repository_event_config" {
    for_each = var.repository_event_config
    content {
      repository = repository_event_config.value.repository

      dynamic "pull_request" {
        for_each = repository_event_config.value.pull_request
        content {
          branch          = pull_request.value.branch
          comment_control = pull_request.value.comment_control
          invert_regex    = pull_request.value.invert_regex
        }
      }

      dynamic "push" {
        for_each = repository_event_config.value.push
        content {
          branch       = push.value.branch
          invert_regex = push.value.invert_regex
          tag          = push.value.tag
        }
      }

    }
  }

  dynamic "source_to_build" {
    for_each = var.source_to_build
    content {
      bitbucket_server_config  = source_to_build.value.bitbucket_server_config
      github_enterprise_config = source_to_build.value.github_enterprise_config
      ref                      = source_to_build.value.ref
      repo_type                = source_to_build.value.repo_type
      repository               = source_to_build.value.repository
      uri                      = source_to_build.value.uri
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

  dynamic "trigger_template" {
    for_each = var.trigger_template
    content {
      branch_name  = trigger_template.value.branch_name
      commit_sha   = trigger_template.value.commit_sha
      dir          = trigger_template.value.dir
      invert_regex = trigger_template.value.invert_regex
      project_id   = trigger_template.value.project_id
      repo_name    = trigger_template.value.repo_name
      tag_name     = trigger_template.value.tag_name
    }
  }

  dynamic "webhook_config" {
    for_each = var.webhook_config
    content {
      secret = webhook_config.value.secret
    }
  }

}
