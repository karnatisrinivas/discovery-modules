data "azurerm_resource_group" "this" {
  depends_on = [var.resource_group_name]
  name       = var.resource_group_name
}

resource "azurerm_role_assignment" "this" {
  principal_id         = var.principal_id
  role_definition_name = var.role_definition_name
  scope                = var.scope == "" ? data.azurerm_resource_group.this.id : var.scope
}

