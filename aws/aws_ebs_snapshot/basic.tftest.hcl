variables {
  volume_id              = "vol-0123456789abcdef0"
  description            = "My snapshot"
  outpost_arn            = "arn:aws:outposts:us-east-1:123456789012:outpost/op-0123456789abcdef0"
  storage_tier           = "standard"
  permanent_restore      = false
  temporary_restore_days = 1
  tags                   = null
  region                 = "us-west-2"
}

run "test" {
  command = plan
  assert {
    condition     = aws_ebs_snapshot.this.volume_id == "vol-0123456789abcdef0"
    error_message = "Snapshot didn't create successfully."
  }
}