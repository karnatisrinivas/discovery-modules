variables {
  bindings = [
    {
      role = "roles/compute.instanceAdmin"
      members = [
        "serviceAccount:your-custom-sa@your-project.iam.gserviceaccount.com",
      ]
      condition_expression  = null
      condition_title       = null
      condition_description = null
    }
  ]
}

run "test" {
  command = plan

  assert {
    condition     = google_project_iam_policy.this.policy_data != null
    error_message = "google_project_iam_policy did not create correctly"
  }
}