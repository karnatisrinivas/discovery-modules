data "aws_networkmanager_devices" "this" {
  global_network_id = var.global_network_id

  site_id = var.site_id
  tags    = var.tags
}
