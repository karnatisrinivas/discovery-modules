variables {
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "this is a cusotm role"
  permissions = ["storage.objects.create"]
  stage       = "GA"
}

run "test" {
  command = plan
  assert {
    condition     = google_project_iam_custom_role.this.role_id == "myCustomRole"
    error_message = "Project Custom Role did not create successfully"
  }
}