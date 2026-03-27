variables {
  location         = "us-west2"
  bucket_id        = "_Default"
  description      = "desc"
  locked           = false
  retention_days   = 1
  enable_analytics = true
  cmek_settings    = []
  index_configs = [
    {
      field_path = "."
      type       = "INDEX_TYPE_UNSPECIFIED"
    }
  ]
}

run "test" {
  command = plan

  assert {
    condition     = google_logging_project_bucket_config.this.bucket_id == "_Default"
    error_message = "google_logging_project_bucket_config was not successful"
  }
}