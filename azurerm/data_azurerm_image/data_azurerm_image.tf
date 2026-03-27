data "azurerm_image" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  sort_descending     = var.sort_descending
  name_regex          = var.name_regex
}