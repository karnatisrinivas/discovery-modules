variables {

  bucket              = "test-bucket"
  force_destroy       = true
  object_lock_enabled = false

  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_s3_bucket.this.bucket == "test-bucket"
    error_message = "AWS S3 bucket name is not correct"
  }

}
