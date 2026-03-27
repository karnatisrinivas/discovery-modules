resource "azurerm_app_service_plan" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  kind                         = var.kind
  maximum_elastic_worker_count = var.maximum_elastic_worker_count

  dynamic "sku" {
    for_each = var.sku
    content {
      tier     = sku.value.tier
      size     = sku.value.size
      capacity = sku.value.capacity
    }
  }

  app_service_environment_id = var.app_service_environment_id
  reserved                   = var.reserved
  per_site_scaling           = var.per_site_scaling
  is_xenon                   = var.is_xenon
  zone_redundant             = var.zone_redundant
  tags                       = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }
}