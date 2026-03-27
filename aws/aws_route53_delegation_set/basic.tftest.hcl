variables {
  reference_name = "test"
  region         = "us-west-2"
}

run "test" {
  command = apply
  assert {
    condition     = aws_route53_delegation_set.this.reference_name == "test"
    error_message = "The test for Route53 Delegation Set did not pass"
  }
}