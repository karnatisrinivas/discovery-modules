data "aws_ecs_task_execution" "this" {
  cluster         = var.cluster
  task_definition = var.task_definition

  client_token            = var.client_token
  desired_count           = var.desired_count
  enable_ecs_managed_tags = var.enable_ecs_managed_tags
  enable_execute_command  = var.enable_execute_command
  group                   = var.group
  launch_type             = var.launch_type
  platform_version        = var.platform_version
  propagate_tags          = var.propagate_tags
  reference_id            = var.reference_id
  started_by              = var.started_by
  tags                    = var.tags
}
