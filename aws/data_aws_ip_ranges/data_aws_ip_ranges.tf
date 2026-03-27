data "aws_ip_ranges" "this" {
  services = var.services

  regions = var.regions
  url     = var.url
}
