variables {
  description         = "Optional description providing context for the resource"
  display_name        = "Human-readable name for the resource (cannot be null)"
  management_group_id = "Specifies the management group this resource belongs to"
  metadata            = ""
  mode                = "All"
  name                = "demo"
  parameters          = ""
  policy_rule         = ""
  policy_type         = "BuiltIn"
  timeouts = {
    create = "10m"
    read   = "5m"
    update = "10m"
    delete = "10m"
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_policy_definition.this.name == "demo"
    error_message = "The name of the Policy Definition is not correct"
  }
}
