variables {
  project         = "project"
  scope_id        = "scope"
  predefined_role = "UNKNOWN"
  labels = {
    label1 : "label"
  }
  user = "username"
}

run "test" {
  command = plan

  assert {
    condition     = google_gke_hub_scope_iam_binding.this.id == "rbac-binding"
    error_message = "google_gke_hub_scope_iam_binding did not create correctly"
  }
}