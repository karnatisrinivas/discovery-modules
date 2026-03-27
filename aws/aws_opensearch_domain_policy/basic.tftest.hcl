variables {
  domain_name     = "example.com"
  access_policies = "{\"Statement\":[{\"Action\":\"es:*\",\"Condition\":{\"IpAddress\":{\"aws:SourceIp\":\"127.0.0.1/32\"}},\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"example.com/*\"}],\"Version\":\"2012-10-17\"}"

  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

}



provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_opensearch_domain_policy.this.domain_name == "example.com"
    error_message = "AWS opensearch domain name is not correct"
  }

}
