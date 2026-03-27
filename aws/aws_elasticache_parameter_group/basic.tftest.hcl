variables {
  name   = "cache-params"
  family = "redis2.8"

  parameter = [
    {
      name  = "timeout"
      value = "300"
    },
    {
      name  = "activerehashing"
      value = "yes"
    },
    {
      name  = "min-slaves-to-write"
      value = "2"
    }
  ]

  tags = {
    Environment = "dev"
    Name        = "test"
  }
  env    = "dev"
  region = "us-east-1"
}

run "validate" {
  command = plan
  assert {
    condition     = aws_elasticache_parameter_group.this.name == "cache-params"
    error_message = "AWS ElastiCache parameter group name is not correct"
  }
}