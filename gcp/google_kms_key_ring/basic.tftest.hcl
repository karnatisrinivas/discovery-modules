variables {
  name     = "ring"
  location = "us-west2"
  project  = "project"
}

run "test" {
  command = plan

  assert {
    condition     = google_kms_key_ring.this.name == "ring"
    error_message = "google_kms_key_ring did not create correctly"
  }
}