resource "azuread_application_password" "this" {
  application_id      = var.application_id
  display_name        = var.display_name
  end_date            = var.end_date
  start_date          = var.start_date
  rotate_when_changed = var.rotate_when_changed
}
