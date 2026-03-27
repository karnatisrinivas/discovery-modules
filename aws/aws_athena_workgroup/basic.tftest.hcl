variables {
  region        = "us-west-2"
  name          = "test-wg"
  description   = "test"
  state         = "ENABLED"
  force_destroy = true
  configuration = [{
    requester_pays_enabled          = true
    bytes_scanned_cutoff_per_query  = 10485760
    enforce_workgroup_configuration = true
    engine_version = [{
      selected_engine_version = "AUTO"
    }]
    execution_role                     = null
    publish_cloudwatch_metrics_enabled = true
    result_configuration = [{
      encryption_configuration = [{
        encryption_option = "SSE_KMS"
        kms_key_arn       = null
      }]
      acl_configuration = [{
        s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
      }]
      output_location       = null
      expected_bucket_owner = null
    }]
  }]

  tags = {
    "Name"        = "test"
    "Region"      = "us-east-1"
    "Environment" = "dev"
  }

}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_athena_workgroup.this.name == "test-wg"
    error_message = "AWS ALB name is not correct"
  }

}
