resource "google_compute_global_address" "this" {
  name         = var.name
  address_type = var.address_type
  purpose      = var.purpose
  network      = var.network
  address      = var.address
  description  = var.description
  ip_version   = var.ip_version

  #This field should be set only for global addresses with address_type EXTERNAL.
  prefix_length = var.address_type == "EXTERNAL" || var.address_type == "INTERNAL" && var.purpose == "VPC_PEERING" ? var.prefix_length : null
}