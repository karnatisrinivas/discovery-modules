variables {
  name            = "sample"
  instance        = "sample-db-tier"
  deletion_policy = "DELETE"
  charset         = "UTF8"
  collation       = "en_US.UTF8"
}

run "test" {
  command = apply
  assert {
    condition     = google_sql_database.this.name == "sample"
    error_message = "SQL Database did not create successfully"
  }
}