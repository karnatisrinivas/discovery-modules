resource "google_gke_hub_scope_iam_binding" "this" {
  project  = var.project
  scope_id = var.scope_id
  role     = var.role
  members  = var.members
}