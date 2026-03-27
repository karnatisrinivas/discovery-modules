resource "azuread_service_principal_password" "this" {
  service_principal_id = var.service_principal_id
  display_name         = var.display_name
  end_date             = var.end_date
  start_date           = var.start_date
  rotate_when_changed  = var.rotate_when_changed
}