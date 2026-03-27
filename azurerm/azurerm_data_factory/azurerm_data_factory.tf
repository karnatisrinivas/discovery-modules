resource "azurerm_data_factory" "this" {
  name                   = var.name
  location               = var.location
  resource_group_name    = var.resource_group_name
  public_network_enabled = var.public_network_enabled
  tags                   = var.tags

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }
}

