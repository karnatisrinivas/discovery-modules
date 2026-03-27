variables {
  constraint     = "serviceuser.services"
  policy_version = 1
  boolean_policy = []
  list_policy    = []
  restore_policy = []
}
run "test" {
  command = plan
  assert {
    condition     = google_project_organization_policy.this.constraint != null
    error_message = "google_project_organization_policy was not succesful"
  }
}