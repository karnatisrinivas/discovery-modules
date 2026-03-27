resource "azurerm_network_interface" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      name                                               = ip_configuration.value.name
      subnet_id                                          = ip_configuration.value.subnet_id == "" ? null : ip_configuration.value.subnet_id
      private_ip_address_allocation                      = ip_configuration.value.private_ip_address_allocation
      private_ip_address_version                         = ip_configuration.value.private_ip_address_version
      primary                                            = ip_configuration.value.primary
      gateway_load_balancer_frontend_ip_configuration_id = ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id == "" ? null : ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      private_ip_address                                 = ip_configuration.value.private_ip_address == "" ? null : ip_configuration.value.private_ip_address
      public_ip_address_id                               = ip_configuration.value.public_ip_address_id == "" ? null : ip_configuration.value.public_ip_address_id
    }

  }
  auxiliary_mode          = var.auxiliary_mode == "" ? null : var.auxiliary_mode
  auxiliary_sku           = var.auxiliary_sku == "" ? null : var.auxiliary_sku
  edge_zone               = var.edge_zone == "" ? null : var.edge_zone
  internal_dns_name_label = var.internal_dns_name_label == "" ? null : var.internal_dns_name_label
  tags                    = var.tags
}