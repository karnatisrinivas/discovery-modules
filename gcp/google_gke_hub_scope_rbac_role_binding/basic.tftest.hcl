variables {
  scope_rbac_role_binding_id = "rbac-binding"
  scope_id                   = "scope"
  predefined_role            = "UNKNOWN"
  labels = {
    label1 : "label"
  }
  user = "username"
}

run "test" {
  command = plan

  assert {
    condition     = google_gke_hub_scope_rbac_role_binding.this.scope_rbac_role_binding_id == "rbac-binding"
    error_message = "google_gke_hub_scope_rbac_role_binding did not create correctly"
  }
}