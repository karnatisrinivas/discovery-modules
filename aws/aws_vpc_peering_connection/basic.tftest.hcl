variables {
  peer_vpc_id   = "vpc-0123456789abcdefg"
  peer_owner_id = "123456789012"
  peer_region   = "us-east-1"
  vpc_id        = "vpc-0123456789abcdefg"
  auto_accept   = true
  accepter = [
    {
      allow_remote_vpc_dns_resolution = true
    }
  ]
  requester = [
    {
      allow_remote_vpc_dns_resolution = true
    }
  ]
  tags = {
    Name = "test"
  }
  region = "us-east-1"
}

run "test" {
  command = plan
  assert {
    condition     = aws_vpc_peering_connection.this.peer_vpc_id == "vpc-0123456789abcdefg"
    error_message = "Didn't find expected peer vpc id"
  }
}