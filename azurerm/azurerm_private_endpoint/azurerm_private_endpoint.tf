resource "azurerm_private_endpoint" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_group
    content {
      name                 = private_dns_zone_group.value.name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_ids
    }
  }

  dynamic "private_service_connection" {
    for_each = var.private_service_connection
    content {
      name                              = private_service_connection.value.name
      private_connection_resource_id    = private_service_connection.value.private_connection_resource_id
      subresource_names                 = private_service_connection.value.subresource_names
      is_manual_connection              = private_service_connection.value.is_manual_connection
      private_connection_resource_alias = private_service_connection.value.private_connection_resource_alias
    }
  }

  custom_network_interface_name = var.custom_network_interface_name
  tags                          = var.tags
}
