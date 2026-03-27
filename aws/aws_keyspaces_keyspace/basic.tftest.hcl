variables {
  name = "mytestkeyspaceskeyspace"
  tags = null
}

run "test" {
  command = plan
  assert {
    condition     = aws_keyspaces_keyspace.this.name == "mytestkeyspaceskeyspace"
    error_message = "Test didn't pass for AWS Keyspaces Keyspace"
  }
}