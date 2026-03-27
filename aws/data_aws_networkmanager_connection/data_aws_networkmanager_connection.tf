data "aws_networkmanager_connection" "this" {
  connection_id     = var.connection_id
  global_network_id = var.global_network_id
}
