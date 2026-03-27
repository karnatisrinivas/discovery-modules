variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = false

  group_object_id  = "00000000-0000-0000-0000-000000000000"
  member_object_id = "00000000-0000-0000-0000-000000000000"
}
run "test" {
  command = plan
  assert {
    condition     = azuread_group_member.this.group_object_id == "00000000-0000-0000-0000-000000000000"
    error_message = "azuread_group_member was not succesful"
  }
}
