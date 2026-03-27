variables {
  name                              = "terraform-example-queue"
  ddl_queue_name                    = ""
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0
  fifo_queue                        = false
  content_based_deduplication       = false
  kms_data_key_reuse_period_seconds = 300
  fifo_throughput_limit             = "perQueue"
  env                               = "dev"
  region                            = "us-east-1"
  kms_master_key_id                 = null
  tags                              = null
}

run "validate" {

  command = plan
  assert {
    condition     = aws_sqs_queue.this.name == "terraform-example-queue"
    error_message = "AWS SQS Queue name is not correct"
  }
}

run "validate-fifo" {
  variables {
    fifo_queue = true
    name       = "terraform-example-queue.fifo"
  }

  command = plan

  assert {
    condition     = aws_sqs_queue.this.name == "terraform-example-queue.fifo"
    error_message = "AWS SQS Queue name is not correct for fifo queue"
  }

}

run "setup-dead-letter-queue" {
  variables {
    fifo_queue = false
    name       = "terraform-example-queue-ddl"
  }

  command = plan

  assert {
    condition     = aws_sqs_queue.this.name == "terraform-example-queue-ddl"
    error_message = "AWS SQS dead letter queue name is not correct"
  }

}
