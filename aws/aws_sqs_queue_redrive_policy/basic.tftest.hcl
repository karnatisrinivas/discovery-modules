variables {
  queue_url      = "some_vpc_id"
  redrive_policy = <<JSON
    {
      "deadLetterTargetArn" : "some_arn",
      "maxReceiveCount"     : 4
    }
    JSON
  region         = "us-east-1"
  tags = {
    "test" = "test"
  }
}

run "validate" {

  command = plan
  assert {
    condition     = aws_sqs_queue_redrive_policy.this.queue_url == "some_vpc_id"
    error_message = "AWS SQS queue redrive_policy queue_url is not correct"
  }
}



