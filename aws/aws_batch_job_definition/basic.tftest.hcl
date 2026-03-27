variables {
  region                     = "us-east-1"
  container_properties       = "{\"command\":[\"ls\",\"-la\"],\"environment\":[],\"image\":\"busybox\",\"mountPoints\":[],\"resourceRequirements\":[{\"type\":\"VCPU\",\"value\":\"4\"},{\"type\":\"MEMORY\",\"value\":\"512\"}],\"secrets\":[],\"ulimits\":[],\"volumes\":[]}"
  parameters                 = {}
  propagate_tags             = false
  scheduling_priority        = 0
  platform_capabilities      = []
  tags                       = {}
  type                       = "container"
  deregister_on_new_revision = false
  ecs_properties             = ""
  name                       = "sometandom"
  node_properties            = ""
  eks_properties             = []
  retry_strategy             = []
  timeout                    = []

}
run "test" {
  command = plan
  assert {
    condition     = aws_batch_job_definition.this.name != null
    error_message = "aws_batch_job_definition was not succesful"
  }
}
