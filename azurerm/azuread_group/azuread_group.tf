resource "azuread_group" "this" {
  display_name               = var.display_name
  assignable_to_role         = var.assignable_to_role
  auto_subscribe_new_members = var.auto_subscribe_new_members
  behaviors                  = var.behaviors
  description                = var.description
  external_senders_allowed   = var.external_senders_allowed
  hide_from_address_lists    = var.hide_from_address_lists
  hide_from_outlook_clients  = var.hide_from_outlook_clients
  mail_enabled               = var.mail_enabled
  mail_nickname              = var.mail_nickname
  members                    = var.members
  owners                     = var.owners
  prevent_duplicate_names    = var.prevent_duplicate_names
  provisioning_options       = var.provisioning_options
  security_enabled           = var.security_enabled
  theme                      = var.theme
  types                      = var.types
  visibility                 = var.visibility
}