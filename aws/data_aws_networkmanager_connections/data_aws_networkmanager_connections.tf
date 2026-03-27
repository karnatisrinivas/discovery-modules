data "aws_networkmanager_connections" "this" {
  global_network_id = var.global_network_id

  device_id = var.device_id
  tags      = var.tags
}
