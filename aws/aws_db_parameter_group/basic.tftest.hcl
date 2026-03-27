variables {
  name        = "hello-world"
  family      = "mysql8.0"
  name_prefix = "hello-"
  description = "This is a test parameter group"
  parameter = [
    {
      name         = "character_set_server"
      value        = "utf8mb4"
      apply_method = "pending-reboot"
    }
  ]
  skip_destroy = true
  tags = {
    "environment" = "dev"
  }
}

run "db_parameter_group" {
  command = apply
  assert {
    condition     = aws_db_parameter_group.this.name == "hello-world"
    error_message = "Name should be hello-world"
  }
}