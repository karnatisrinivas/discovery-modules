variables {
  user       = "exampleuser"
  policy_arn = "arn:aws:iam::123456789012:policy/example-custom-policy"
}

run "test" {
  command = apply
  assert {
    condition     = aws_iam_user_policy_attachment.this.user == "exampleuser"
    error_message = "Could not connect User to Policy"
  }
}