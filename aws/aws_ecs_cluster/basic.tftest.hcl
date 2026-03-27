variables {
  env    = "cesar"
  region = "us-east-2"
  name   = "test-cluster"
  setting = [
    {
      name : "containerInsights"
      value : "enabled"
    }
  ]
  configuration            = null
  service_connect_defaults = null
  tags                     = null
}

run "validate" {
  command = plan
  assert {
    condition     = aws_ecs_cluster.this.name == "test-cluster"
    error_message = "ECS cluster name is not correct"
  }

}
