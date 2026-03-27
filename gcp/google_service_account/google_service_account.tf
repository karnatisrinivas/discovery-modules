resource "google_service_account" "this" {
  account_id                   = var.account_id
  display_name                 = var.display_name
  description                  = var.description
  disabled                     = var.disabled
  create_ignore_already_exists = var.create_ignore_already_exists
}
