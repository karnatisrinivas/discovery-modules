variables {
  description         = "test"
  enable_key_rotation = true

  tags = {
    Environment = "dev"
    Name        = "test-kms-key"
  }

}

provider "aws" {
  region = "us-west-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_kms_key.this.description == "test"
    error_message = "AWS KMS key description is not correct"
  }

}
