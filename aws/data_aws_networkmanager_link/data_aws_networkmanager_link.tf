data "aws_networkmanager_link" "this" {
  global_network_id = var.global_network_id
  link_id           = var.link_id
}
