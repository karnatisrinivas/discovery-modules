variables {
  region                    = "" # Specify the AWS region, e.g., "us-east-1"
  arn                       = "arn:aws:sqs:us-east-1:123456789012:example-queue"
  appsync_target            = [] # Fill in the AppSync target configurations
  batch_target              = []
  dead_letter_config        = []
  ecs_target                = []        # Define ECS task target configurations
  event_bus_name            = "default" # Name of the event bus
  force_destroy             = false     # Set to true or false based on your needs
  http_target               = []
  input                     = null           # Input data for event processing
  input_path                = "$"            # JSON path to extract from event
  input_transformer         = []             # Specify transformations for event input
  kinesis_target            = []             # Configure Kinesis stream targets
  redshift_target           = []             # Include Redshift details like database name
  retry_policy              = []             # Define retry behavior for failures
  role_arn                  = ""             # IAM role ARN for access control
  rule                      = "custom-rule"  # Specify the event rule
  run_command_targets       = []             # Include keys/values for EC2 instance commands
  sagemaker_pipeline_target = []             # Add SageMaker pipeline configurations
  sqs_target                = []             # Define SQS queue targets
  target_id                 = "my-target-id" # Identifier for the event target
}

run "validate" {
  command = plan
  assert {
    condition     = aws_cloudwatch_event_target.this.target_id == "my-target-id"
    error_message = "aws_cloudwatch_event_target target_id is not correct"
  }

}
