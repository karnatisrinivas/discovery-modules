resource "azurerm_log_analytics_solution" "this" {
  location              = var.location
  resource_group_name   = var.resource_group_name
  solution_name         = var.solution_name
  workspace_name        = var.workspace_name
  workspace_resource_id = var.workspace_resource_id
  plan {
    publisher = var.publisher
    product   = var.product
  }
  tags = var.tags
}
