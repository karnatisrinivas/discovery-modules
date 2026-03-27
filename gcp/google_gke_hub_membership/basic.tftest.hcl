variables {
  membership_id = "my-membership"
  cluster       = "clusterid"
}

run "test" {
  command = plan
  assert {
    condition     = google_gke_hub_membership.this.membership_id == "my-membership"
    error_message = "google_gke_hub_membership did not create correctly"
  }
}