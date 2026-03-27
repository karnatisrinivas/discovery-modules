resource "azurerm_service_plan" "this" {
  location            = var.location
  name                = var.name
  os_type             = var.os_type
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  app_service_environment_id = var.app_service_environment_id == "" ? null : var.app_service_environment_id
  per_site_scaling_enabled   = var.per_site_scaling_enabled
  tags                       = var.tags
  zone_balancing_enabled     = var.zone_balancing_enabled
}
