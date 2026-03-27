resource "aws_codepipeline" "this" {
  execution_mode = var.execution_mode
  name           = var.name
  pipeline_type  = var.pipeline_type
  role_arn       = var.role_arn
  tags           = var.tags

  dynamic "artifact_store" {
    for_each = var.artifact_store
    content {
      location = artifact_store.value.location
      region   = artifact_store.value.region
      type     = artifact_store.value.type

      dynamic "encryption_key" {
        for_each = artifact_store.value.encryption_key
        content {
          id   = encryption_key.value.id
          type = encryption_key.value.type
        }
      }

    }
  }

  dynamic "stage" {
    for_each = var.stage
    content {
      name = stage.value.name

      dynamic "action" {
        for_each = stage.value.action
        content {
          category           = action.value.category
          configuration      = action.value.configuration
          input_artifacts    = action.value.input_artifacts
          name               = action.value.name
          namespace          = action.value.namespace
          output_artifacts   = action.value.output_artifacts
          owner              = action.value.owner
          provider           = action.value.provider
          region             = action.value.region
          role_arn           = action.value.role_arn
          run_order          = action.value.run_order
          timeout_in_minutes = action.value.timeout_in_minutes
          version            = action.value.version
        }
      }

      dynamic "before_entry" {
        for_each = stage.value.before_entry
        content {
          dynamic "condition" {
            for_each = before_entry.value.condition
            content {
              result = condition.value.result

              dynamic "rule" {
                for_each = condition.value.rule
                content {
                  commands           = rule.value.commands
                  configuration      = rule.value.configuration
                  input_artifacts    = rule.value.input_artifacts
                  name               = rule.value.name
                  region             = rule.value.region
                  role_arn           = rule.value.role_arn
                  timeout_in_minutes = rule.value.timeout_in_minutes

                  dynamic "rule_type_id" {
                    for_each = rule.value.rule_type_id
                    content {
                      category = rule_type_id.value.category
                      owner    = rule_type_id.value.owner
                      provider = rule_type_id.value.provider
                      version  = rule_type_id.value.version
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "on_failure" {
        for_each = stage.value.on_failure
        content {
          result = on_failure.value.result

          dynamic "condition" {
            for_each = on_failure.value.condition
            content {
              result = condition.value.result

              dynamic "rule" {
                for_each = condition.value.rule
                content {
                  commands           = rule.value.commands
                  configuration      = rule.value.configuration
                  input_artifacts    = rule.value.input_artifacts
                  name               = rule.value.name
                  region             = rule.value.region
                  role_arn           = rule.value.role_arn
                  timeout_in_minutes = rule.value.timeout_in_minutes

                  dynamic "rule_type_id" {
                    for_each = rule.value.rule_type_id
                    content {
                      category = rule_type_id.value.category
                      owner    = rule_type_id.value.owner
                      provider = rule_type_id.value.provider
                      version  = rule_type_id.value.version
                    }
                  }

                }
              }

            }
          }

          dynamic "retry_configuration" {
            for_each = on_failure.value.retry_configuration
            content {
              retry_mode = retry_configuration.value.retry_mode
            }
          }

        }
      }

      dynamic "on_success" {
        for_each = stage.value.on_success
        content {
          dynamic "condition" {
            for_each = on_success.value.condition
            content {
              result = condition.value.result

              dynamic "rule" {
                for_each = condition.value.rule
                content {
                  commands           = rule.value.commands
                  configuration      = rule.value.configuration
                  input_artifacts    = rule.value.input_artifacts
                  name               = rule.value.name
                  region             = rule.value.region
                  role_arn           = rule.value.role_arn
                  timeout_in_minutes = rule.value.timeout_in_minutes

                  dynamic "rule_type_id" {
                    for_each = rule.value.rule_type_id
                    content {
                      category = rule_type_id.value.category
                      owner    = rule_type_id.value.owner
                      provider = rule_type_id.value.provider
                      version  = rule_type_id.value.version
                    }
                  }

                }
              }

            }
          }

        }
      }

    }
  }

  dynamic "trigger" {
    for_each = var.trigger
    content {
      provider_type = trigger.value.provider_type

      dynamic "git_configuration" {
        for_each = trigger.value.git_configuration
        content {
          source_action_name = git_configuration.value.source_action_name

          dynamic "pull_request" {
            for_each = git_configuration.value.pull_request
            content {
              events = pull_request.value.events

              dynamic "branches" {
                for_each = pull_request.value.branches
                content {
                  excludes = branches.value.excludes
                  includes = branches.value.includes
                }
              }

              dynamic "file_paths" {
                for_each = pull_request.value.file_paths
                content {
                  excludes = file_paths.value.excludes
                  includes = file_paths.value.includes
                }
              }

            }
          }

          dynamic "push" {
            for_each = git_configuration.value.push
            content {
              dynamic "branches" {
                for_each = push.value.branches
                content {
                  excludes = branches.value.excludes
                  includes = branches.value.includes
                }
              }

              dynamic "file_paths" {
                for_each = push.value.file_paths
                content {
                  excludes = file_paths.value.excludes
                  includes = file_paths.value.includes
                }
              }

              dynamic "tags" {
                for_each = push.value.tags
                content {
                  excludes = tags.value.excludes
                  includes = tags.value.includes
                }
              }

            }
          }

        }
      }

    }
  }

  dynamic "variable" {
    for_each = var.variable
    content {
      default_value = variable.value.default_value
      description   = variable.value.description
      name          = variable.value.name
    }
  }

}
