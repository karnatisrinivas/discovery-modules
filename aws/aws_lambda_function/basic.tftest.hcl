variables {
  region                             = "us-west-2"
  function_name                      = "test"
  role                               = "arn:aws:iam::123456789012:role/execution_role"
  architectures                      = ["x86_64"]
  code_signing_config_arn            = "arn:aws:lambda:us-west-2:123456789012:code-signing-config:csc-abcdef123456"
  dead_letter_config                 = [{ target_arn = "arn:aws:sqs:us-west-2:123456789012:my-dead-letter-queue" }]
  description                        = "My Lambda function"
  environment                        = [{ variables = { "ENV_VAR_1" = "value1", "ENV_VAR_2" = "value2" } }]
  ephemeral_storage                  = [{ size = 512 }]
  file_system_config                 = [{ arn = "arn:aws:efs:us-west-2:123456789012:file-system/fs-abcdef12", local_mount_path = "/mnt/efs" }]
  filename                           = null
  handler                            = "index.handler"
  image_config                       = [{ command = ["command1", "command2"], entry_point = ["entry_point"], working_directory = "/app" }]
  image_uri                          = "123456789012.dkr.ecr.us-west-2.amazonaws.com/my-repo:latest"
  kms_key_arn                        = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  layers                             = ["arn:aws:lambda:us-west-2:123456789012:layer:my-layer:1"]
  logging_config                     = [{ application_log_level = "DEBUG", log_format = "JSON", log_group = "/aws/lambda/my-function", system_log_level = "INFO" }]
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = false
  reserved_concurrent_executions     = -1
  replace_security_groups_on_destroy = false
  replacement_security_group_ids     = ["sg-0a1eeecd978b2d990"]
  runtime                            = "python3.8"
  s3_bucket                          = null
  s3_key                             = null
  s3_object_version                  = null
  skip_destroy                       = false
  source_code_hash                   = "abcd1234"
  snap_start                         = [{ apply_on = "PublishedVersions" }]
  tags = {
    "Name"        = "my_lambda_function"
    "Environment" = "dev"
  }
  timeout        = 3
  tracing_config = [{ mode = "Active" }]
  vpc_config = [{
    ipv6_allowed_for_dual_stack = true,
    security_group_ids          = ["sg-0a1eeecd978b2d990"],
    subnet_ids                  = ["subnet-0a1eeecd978b2d990", "subnet-06a1939485b03e1e8", "subnet-0227e2b0abc5f975e"]
  }]
  timeouts = {
    create = "10m"
    delete = "10m"
    update = "10m"
  }
}



run "validate" {
  command = plan
  assert {
    condition     = aws_lambda_function.this.function_name == "test"
    error_message = "AWS Lambda function name is not correct"
  }

}
