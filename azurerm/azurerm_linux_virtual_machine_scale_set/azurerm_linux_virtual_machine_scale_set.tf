resource "azurerm_linux_virtual_machine_scale_set" "this" {
  admin_username      = var.admin_username
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.os_sku
    version   = var.os_version
  }

  network_interface {
    name    = "primaryNetworkInterface"
    primary = true

    ip_configuration {
      name      = "subnetConfiguration"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  admin_password                                    = var.admin_password
  capacity_reservation_group_id                     = var.capacity_reservation_group_id
  custom_data                                       = var.custom_data
  disable_password_authentication                   = var.disable_password_authentication
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.edge_zone
  encryption_at_host_enabled                        = var.encryption_at_host_enabled
  eviction_policy                                   = var.eviction_policy
  extensions_time_budget                            = var.extensions_time_budget
  health_probe_id                                   = var.health_probe_id
  host_group_id                                     = var.host_group_id
  instances                                         = var.instances
  max_bid_price                                     = var.max_bid_price
  overprovision                                     = var.overprovision
  priority                                          = var.priority
  provision_vm_agent                                = var.provision_vm_agent
  proximity_placement_group_id                      = var.proximity_placement_group_id
  secure_boot_enabled                               = var.secure_boot_enabled
  single_placement_group                            = var.single_placement_group
  source_image_id                                   = var.source_image_id
  tags                                              = var.tags
  upgrade_mode                                      = var.upgrade_mode
  user_data                                         = var.user_data
  vtpm_enabled                                      = var.vtpm_enabled
  zone_balance                                      = var.zone_balance
  zones                                             = var.zones
}
