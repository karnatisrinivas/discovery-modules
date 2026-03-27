variables {
  region                      = "us-east-1"
  tags                        = {}
  allow_major_version_upgrade = false
  apply_immediately           = false
  replication_instance_class  = "dms.t3.micro"
  replication_instance_id     = "sometandom"
  timeouts                    = {}
}
run "test" {
  command = plan
  assert {
    condition     = aws_dms_replication_instance.this.replication_instance_id != null
    error_message = "aws_dms_replication_instance was not succesful"
  }
}
