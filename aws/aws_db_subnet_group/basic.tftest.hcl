variables {
  name        = "hello"
  name_prefix = null
  description = "this is a db subnet group."
  subnet_ids  = ["subnet-0123456789abcdef0"]
  tags        = {}
}

run "test" {
  command = plan
  assert {
    condition     = aws_db_subnet_group.this.name == "hello"
    error_message = "The test for DB Subnet Group was not successful."
  }
}