variables {
  name       = "cache-subnet-group"
  subnet_ids = ["subnet-0bb1c79de3EXAMPLE", "subnet-0d5d9d6dEXAMPLE"]
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
    condition     = aws_elasticache_subnet_group.this.name == "cache-subnet-group"
    error_message = "AWS ElastiCache subnet group name is not correct"
  }
}