data "google_billing_account" "this" {
  billing_account = var.billing_account
  display_name    = var.display_name
  lookup_projects = var.lookup_projects
  open            = var.open

}
