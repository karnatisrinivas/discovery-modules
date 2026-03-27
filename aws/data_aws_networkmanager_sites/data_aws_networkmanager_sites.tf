data "aws_networkmanager_sites" "this" {
  global_network_id = var.global_network_id

  tags = var.tags
}
