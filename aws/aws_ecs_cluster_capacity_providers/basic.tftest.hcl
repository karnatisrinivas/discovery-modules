variables {
  cluster_name       = "example.cluster.name"
  capacity_providers = ["FARGATE"]
  default_capacity_provider_strategy = [
    {
      base              = 1
      weight            = 100
      capacity_provider = "FARGATE"
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_ecs_cluster_capacity_providers.this.cluster_name == "example.cluster.name"
    error_message = "The test for AWS ECS Cluster Capacity Providers did not pass."
  }
}