variables {
  repository = "repository-name"
  policy     = "{\"Statement\": [{\"Action\": \"sts:AssumeRole\",\"Effect\": \"Allow\",\"Principal\": \"*\",\"Sid\": \"AllowPrinciple\"},{\"Action\": \"sts:AssumeRole\",\"Effect\": \"Allow\",\"Principal\": {\"Service\": \"*\"},\"Sid\": \"AllowService\"}],\"Version\": \"2008-10-17\"}"
}

run "test" {
  command = plan
  assert {
    condition     = aws_ecr_repository_policy.this.repository == "repository-name"
    error_message = "The test for aws_ecr_repository_policy did not pass."
  }
}