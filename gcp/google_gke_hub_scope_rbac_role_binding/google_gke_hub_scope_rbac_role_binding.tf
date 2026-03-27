resource "google_gke_hub_scope_rbac_role_binding" "this" {
  scope_rbac_role_binding_id = var.scope_rbac_role_binding_id
  scope_id                   = var.scope_id
  user                       = var.user
  role {
    predefined_role = var.predefined_role
  }
  labels = var.labels
}