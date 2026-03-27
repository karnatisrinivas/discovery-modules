variables {
  name     = "my-feature"
  location = "us-west2"
}

run "test" {
  command = plan
  assert {
    condition     = google_gke_hub_feature.this.name == "my-feature"
    error_message = "google_gke_hub_feature did not create correctly"
  }
}