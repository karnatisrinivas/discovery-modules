#tftest.hcl
variables {
  region                           = "us-west-2"
  zone_id                          = "Z076352538M1IZDY9SBT9"
  name                             = "test"
  type                             = "A"
  records                          = ["1.2.3.4"]
  set_identifier                   = "test"
  multivalue_answer_routing_policy = null
  ttl                              = 300
  geolocation_routing_policy = [
    {
      continent   = "us"
      country     = "us"
      subdivision = "wa"
    }
  ]
  alias = []
}

run "validate" {
  command = plan
  assert {
    condition     = aws_route53_record.this.name == "test"
    error_message = "Incorrect AWS route53 record name"
  }
}