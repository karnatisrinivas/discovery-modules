variables {
  name        = "test-query"
  description = "test-query-description"
  query       = "SELECT * FROM table"
  workgroup   = "primary"
  database    = "test"
}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_athena_named_query.this.name == "test-query"
    error_message = "AWS Athena query name is not correct"
  }

}
