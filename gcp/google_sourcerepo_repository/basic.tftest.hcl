variables {
  name                  = "testrepo"
  topic                 = "testtopic"
  service_account_email = "hello@gmail.com"
}

provider "google" {
  project = "example-gcp-project"
}

run "test" {
  command = plan

  assert {
    condition     = google_sourcerepo_repository.this.name == "testrepo"
    error_message = "google_sourcerepo_repository did not create correctly"
  }
}