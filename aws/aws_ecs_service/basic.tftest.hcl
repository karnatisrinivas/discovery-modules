variables {
  region                             = "us-east-1"
  name                               = "test"
  cluster                            = "test"
  availability_zone_rebalancing      = null
  task_definition                    = null
  launch_type                        = null
  force_delete                       = null
  desired_count                      = null
  platform_version                   = null
  propagate_tags                     = null
  scheduling_strategy                = null
  deployment_maximum_percent         = null
  deployment_minimum_healthy_percent = null
  enable_ecs_managed_tags            = null
  enable_execute_command             = null
  force_new_deployment               = null
  health_check_grace_period_seconds  = null
  iam_role                           = null
  wait_for_steady_state              = null
  tags                               = null
  load_balancer                      = []
  capacity_provider_strategy         = []
  deployment_circuit_breaker         = []
  network_configuration              = []
  deployment_controller              = []
  ordered_placement_strategy         = []
  placement_constraints              = []
  service_registries                 = []
  timeouts = {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}

run "ecs_service" {
  command = plan
  assert {
    condition     = aws_ecs_service.this.name == "test"
    error_message = "Expected the name to be test"
  }
}