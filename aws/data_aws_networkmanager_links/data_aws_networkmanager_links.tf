data "aws_networkmanager_links" "this" {
  global_network_id = var.global_network_id

  provider_name = var.provider_name
  site_id       = var.site_id
  tags          = var.tags
  type          = var.type
}
