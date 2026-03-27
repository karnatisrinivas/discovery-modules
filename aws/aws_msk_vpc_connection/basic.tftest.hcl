#tftest.hcl
variables {
  region             = "us-east-2"
  env                = "dev"
  security_groups    = ["sg-0f5781b48c03f6f2a"]
  client_subnets     = ["subnet-026a7c8d08743d2f8", "subnet-0227e2b0abc5f975e"]
  vpc_id             = "vpc-0c37ffe0affae162f"
  target_cluster_arn = "test-msk-cluster"
  authentication     = "SASL_IAM"
}

run "validate" {

  command = plan
  assert {
    condition     = aws_msk_vpc_connection.this.target_cluster_arn == "test-msk-cluster"
    error_message = "target cluster arn name is not correct"
  }
}
