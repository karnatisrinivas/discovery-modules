variables {
  availability_zone    = "us-east-1a"
  encrypted            = true
  final_snapshot       = true
  iops                 = 54
  multi_attach_enabled = true
  size                 = 5
  snapshot_id          = "1"
  outpost_arn          = "arn:aws:service:us-east-1:012345678911:resource-id"
  type                 = "io1"
  kms_key_id           = "arn:aws:service:us-east-1:012345678911:resource-id"
  tags                 = {}
  throughput           = null
}

run "test" {
  command = plan
  assert {
    condition     = aws_ebs_volume.this.availability_zone == "us-east-1a"
    error_message = "The test for aws_ebs did not pass."
  }
}