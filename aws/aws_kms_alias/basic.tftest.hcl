variables {
  region        = "us-east-2"
  env           = "dev"
  name          = "alias/test"
  target_key_id = "some-id"
}

run "validate" {

  command = plan
  assert {
    condition     = aws_kms_alias.this.name == "alias/test"
    error_message = "kms alias name is not correct"
  }

}
