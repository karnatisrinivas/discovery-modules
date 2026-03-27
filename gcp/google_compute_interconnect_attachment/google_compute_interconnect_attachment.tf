resource "google_compute_interconnect_attachment" "this" {
  admin_enabled            = var.admin_enabled
  bandwidth                = var.bandwidth
  candidate_subnets        = var.candidate_subnets
  description              = var.description
  edge_availability_domain = var.edge_availability_domain
  encryption               = var.encryption
  interconnect             = var.interconnect
  ipsec_internal_addresses = var.ipsec_internal_addresses
  labels                   = var.labels
  mtu                      = var.mtu
  name                     = var.name
  router                   = var.router
  stack_type               = var.stack_type
  subnet_length            = var.subnet_length
  type                     = var.type
  vlan_tag8021q            = var.vlan_tag8021q

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
