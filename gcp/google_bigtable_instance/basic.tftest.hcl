variables {
  deletion_protection          = "UNPROTECTED"
  name                         = "my-table"
  split_keys                   = ["row-key-1", "row-key-2"]
  instance_deletion_protection = false
  change_stream_retention      = "24h0m0s"
  automated_backup_policy      = "DISABLE"
  column_family = [
    { family = "cf1" }
  ]
  iam_roles = []
}

run "test" {
  command = apply

  assert {
    condition     = google_bigtable_table.this.name == "my-table"
    error_message = "Google Bigtable Table did not generate correctly"
  }
}