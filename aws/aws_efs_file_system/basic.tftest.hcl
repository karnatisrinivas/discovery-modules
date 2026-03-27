variables {
  region                          = "us-west-2"
  availability_zone_name          = "us-west-2a"
  creation_token                  = null
  encrypted                       = false
  kms_key_id                      = null
  performance_mode                = "generalPurpose"
  throughput_mode                 = "bursting"
  provisioned_throughput_in_mibps = null
  lifecycle_policy = [
  ]
  protection = []
  tags = {
    Name = "example-app"
  }
}

run "efs_creation" {
  command = apply
  assert {
    condition     = aws_efs_file_system.this.id != null
    error_message = "EFS file system not created"
  }
}