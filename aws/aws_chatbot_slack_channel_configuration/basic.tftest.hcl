variables {
  configuration_name = "sample-config"
  iam_role_arn       = "arn:aws:iam::123456789012:role/execution_role"
  slack_channel_id   = "C07EZ1ABC23"
  slack_team_id      = "T07EA123LEP"
  tags = {
    "Name"    = "HelloWorld"
    "Env"     = "Prod"
    "project" = "sample"
  }
}

run "validate" {
  command = plan
  assert {
    condition     = aws_chatbot_slack_channel_configuration.this.configuration_name == "sample-config"
    error_message = "Chatbot configuration name is not correct."
  }
}
