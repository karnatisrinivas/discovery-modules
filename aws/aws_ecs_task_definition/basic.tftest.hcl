variables {
  region                   = "us-east-1"
  family                   = "test-family"
  network_mode             = "none"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::123456789012:role/ecsTaskRole"
  track_latest             = false
  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }
  enable_fault_injection = false
  ipc_mode               = "host"
  pid_mode               = "host"
  proxy_configuration    = []
  ephemeral_storage = [{
    size_in_gib = 25
  }]
  skip_destroy = false
  volume       = []

  container_definitions = "[{\"environment\":[],\"essential\":true,\"image\":\"nginx:latest\",\"mountPoints\":[],\"name\":\"my-app\",\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\"}],\"systemControls\":[],\"volumesFrom\":[]}]"

  inference_accelerator = []
  placement_constraints = []
  runtime_platform      = []


}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_ecs_task_definition.this.family == "test-family"
    error_message = "AWS ECS task definition family name is not correct"
  }

}
