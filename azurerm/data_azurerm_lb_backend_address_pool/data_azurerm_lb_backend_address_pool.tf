data "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = var.loadbalancer_id
  name            = var.name
}
