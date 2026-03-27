resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = var.loadbalancer_id
  name            = var.name

  synchronous_mode   = var.synchronous_mode
  virtual_network_id = var.virtual_network_id
}
