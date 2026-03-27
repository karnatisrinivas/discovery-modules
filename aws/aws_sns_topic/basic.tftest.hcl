variables {
  name                                     = "example_topic"
  display_name                             = "example_topic_display_name"
  delivery_policy                          = null
  application_success_feedback_role_arn    = null
  application_success_feedback_sample_rate = null
  application_failure_feedback_role_arn    = null
  http_success_feedback_role_arn           = null
  http_success_feedback_sample_rate        = null
  http_failure_feedback_role_arn           = null
  signature_version                        = null
  tracing_config                           = null
  fifo_topic                               = null
  content_based_deduplication              = null
  lambda_success_feedback_role_arn         = null
  lambda_success_feedback_sample_rate      = null
  lambda_failure_feedback_role_arn         = null
  sqs_success_feedback_role_arn            = null
  sqs_success_feedback_sample_rate         = null
  sqs_failure_feedback_role_arn            = null
  firehose_success_feedback_role_arn       = null
  firehose_success_feedback_sample_rate    = null
  firehose_failure_feedback_role_arn       = null
  env                                      = "dev"
  region                                   = "us-east-1"
  kms_master_key_id                        = null
  tags                                     = null
}

run "validate" {

  command = plan
  assert {
    condition     = aws_sns_topic.this.name == "example_topic"
    error_message = "AWS SNS topic name is not correct"
  }

  assert {
    condition     = aws_sns_topic.this.display_name == "example_topic_display_name"
    error_message = "AWS SNS topic display name is not correct"
  }

}

run "validate-fifo" {
  variables {
    fifo_topic = true
    name       = "dummy.fifo"
  }

  command = plan

  assert {
    condition     = aws_sns_topic.this.name == "dummy.fifo"
    error_message = "AWS SNS topic topic name is not correct for fifo topic"
  }
}
