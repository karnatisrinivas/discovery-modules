variables {
  runtime         = "python27"
  service         = "myapp"
  shell           = "shell"
  zip_source_url  = "url"
  zip_files_count = 30
  files = [
    {
      name       = "file1"
      sha1_sum   = null
      source_url = "url"
    },
    {
      name       = "file2"
      sha1_sum   = null
      source_url = "url"
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = google_app_engine_standard_app_version.this.runtime == "python27"
    error_message = "google_app_engine_standard_app_version unsucessful"
  }
}