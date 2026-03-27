resource "aws_cloudwatch_event_target" "this" {
  arn            = var.arn
  event_bus_name = var.event_bus_name
  force_destroy  = var.force_destroy
  input          = var.input == "" ? null : var.input
  input_path     = var.input_path == "" ? null : var.input_path
  role_arn       = var.role_arn
  rule           = var.rule
  target_id      = var.target_id

  dynamic "appsync_target" {
    for_each = var.appsync_target
    content {
      graphql_operation = appsync_target.value.graphql_operation
    }
  }

  dynamic "batch_target" {
    for_each = var.batch_target
    content {
      array_size     = batch_target.value.array_size
      job_attempts   = batch_target.value.job_attempts
      job_definition = batch_target.value.job_definition
      job_name       = batch_target.value.job_name
    }
  }

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config
    content {
      arn = dead_letter_config.value.arn
    }
  }

  dynamic "ecs_target" {
    for_each = var.ecs_target
    content {
      enable_ecs_managed_tags = ecs_target.value.enable_ecs_managed_tags
      enable_execute_command  = ecs_target.value.enable_execute_command
      group                   = ecs_target.value.group
      launch_type             = ecs_target.value.launch_type
      platform_version        = ecs_target.value.platform_version
      propagate_tags          = ecs_target.value.propagate_tags
      tags                    = ecs_target.value.tags
      task_count              = ecs_target.value.task_count
      task_definition_arn     = ecs_target.value.task_definition_arn

      dynamic "capacity_provider_strategy" {
        for_each = ecs_target.value.capacity_provider_strategy
        content {
          base              = capacity_provider_strategy.value.base
          capacity_provider = capacity_provider_strategy.value.capacity_provider
          weight            = capacity_provider_strategy.value.weight
        }
      }

      dynamic "network_configuration" {
        for_each = ecs_target.value.network_configuration
        content {
          assign_public_ip = network_configuration.value.assign_public_ip
          security_groups  = network_configuration.value.security_groups
          subnets          = network_configuration.value.subnets
        }
      }

      dynamic "ordered_placement_strategy" {
        for_each = ecs_target.value.ordered_placement_strategy
        content {
          field = ordered_placement_strategy.value.field
          type  = ordered_placement_strategy.value.type
        }
      }

      dynamic "placement_constraint" {
        for_each = ecs_target.value.placement_constraint
        content {
          expression = placement_constraint.value.expression
          type       = placement_constraint.value.type
        }
      }

    }
  }

  dynamic "http_target" {
    for_each = var.http_target
    content {
      header_parameters       = http_target.value.header_parameters
      path_parameter_values   = http_target.value.path_parameter_values
      query_string_parameters = http_target.value.query_string_parameters
    }
  }

  dynamic "input_transformer" {
    for_each = var.input_transformer
    content {
      input_paths    = input_transformer.value.input_paths
      input_template = input_transformer.value.input_template
    }
  }

  dynamic "kinesis_target" {
    for_each = var.kinesis_target
    content {
      partition_key_path = kinesis_target.value.partition_key_path
    }
  }

  dynamic "redshift_target" {
    for_each = var.redshift_target
    content {
      database            = redshift_target.value.database
      db_user             = redshift_target.value.db_user
      secrets_manager_arn = redshift_target.value.secrets_manager_arn
      sql                 = redshift_target.value.sql
      statement_name      = redshift_target.value.statement_name
      with_event          = redshift_target.value.with_event
    }
  }

  dynamic "retry_policy" {
    for_each = var.retry_policy
    content {
      maximum_event_age_in_seconds = retry_policy.value.maximum_event_age_in_seconds
      maximum_retry_attempts       = retry_policy.value.maximum_retry_attempts
    }
  }

  dynamic "run_command_targets" {
    for_each = var.run_command_targets
    content {
      key    = run_command_targets.value.key
      values = run_command_targets.value.values
    }
  }

  dynamic "sagemaker_pipeline_target" {
    for_each = var.sagemaker_pipeline_target
    content {
      dynamic "pipeline_parameter_list" {
        for_each = sagemaker_pipeline_target.value.pipeline_parameter_list
        content {
          name  = pipeline_parameter_list.value.name
          value = pipeline_parameter_list.value.value
        }
      }

    }
  }

  dynamic "sqs_target" {
    for_each = var.sqs_target
    content {
      message_group_id = sqs_target.value.message_group_id
    }
  }

}
