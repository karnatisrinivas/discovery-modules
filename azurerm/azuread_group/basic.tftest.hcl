variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = false

  display_name               = "test-group"
  assignable_to_role         = false
  auto_subscribe_new_members = false
  behaviors                  = []
  description                = null
  external_senders_allowed   = false
  hide_from_address_lists    = false
  hide_from_outlook_clients  = false
  mail_enabled               = false
  mail_nickname              = null
  members                    = []
  owners                     = ["33333333-3333-3333-3333-333333333333"]
  prevent_duplicate_names    = false
  provisioning_options       = []
  security_enabled           = true
  theme                      = null
  types                      = []
  visibility                 = null
}

run "test" {
  command = plan

  assert {
    condition     = azuread_group.this.display_name != null
    error_message = "azuread_group was not successful"
  }
}