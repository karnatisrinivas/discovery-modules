variables {
  queue_url            = "some_vpc_id"
  redrive_allow_policy = <<JSON
    {
      "redrivePermission" : "byQueue",
      "sourceQueueArns"     : ["some_arn"]
    }
    JSON
  region               = "us-east-1"
  tags = {
    "test" = "test"
  }
}

run "validate" {

  command = plan
  assert {
    condition     = aws_sqs_queue_redrive_allow_policy.this.queue_url == "some_vpc_id"
    error_message = "AWS SQS queue redrive_allow_policy queue_url is not correct"
  }
}



