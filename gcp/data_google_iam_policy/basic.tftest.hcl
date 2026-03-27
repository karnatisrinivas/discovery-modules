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
    condition     = length(data.google_iam_policy.this.binding) == 1
    error_message = "data_google_iam_policy did not create correctly"
  }
}