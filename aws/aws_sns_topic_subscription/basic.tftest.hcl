variables {
  endpoint                        = "arn:aws:firehose:us-east-1:123456789012:deliverystream/ticketUploadStream"
  protocol                        = "firehose"
  subscription_role_arn           = "arn:aws:firehose:us-east-1:123456789012:deliverystream/ticketUploadStream"
  topic_arn                       = "arn:aws:firehose:us-east-1:123456789012:deliverystream/ticketUploadStream"
  confirmation_timeout_in_minutes = null
  delivery_policy                 = null
  endpoint_auto_confirms          = true
  filter_policy                   = null
  filter_policy_scope             = null
  raw_message_delivery            = true
  redrive_policy                  = null
  replay_policy                   = null
}

run "test" {
  command = plan
  assert {
    condition     = aws_sns_topic_subscription.this.endpoint == "arn:aws:firehose:us-east-1:123456789012:deliverystream/ticketUploadStream"
    error_message = "Test for AWS SNS Topic Subscription did not pass."
  }
}