#tftest.hcl
variables {
  group_name        = "some_grp_name"
  filter_expression = "10.0.0.0/16"
  insights_configuration = [
    {
      insights_enabled      = true
      notifications_enabled = true
    }
  ]
  tags = {
    "test" = "test"
  }
}

run "validate" {
  command = plan
  assert {
    condition     = aws_xray_group.this.group_name == "some_grp_name"
    error_message = "xray group name is not correct"
  }
}
