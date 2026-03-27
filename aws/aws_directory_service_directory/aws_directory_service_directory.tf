resource "aws_directory_service_directory" "this" {
  alias                                = var.alias
  description                          = var.description
  desired_number_of_domain_controllers = var.desired_number_of_domain_controllers
  edition                              = var.edition
  enable_sso                           = var.enable_sso
  name                                 = var.name
  password                             = var.password
  short_name                           = var.short_name
  size                                 = var.size
  tags                                 = var.tags
  type                                 = var.type

  dynamic "connect_settings" {
    for_each = var.connect_settings
    content {
      customer_dns_ips  = connect_settings.value.customer_dns_ips
      customer_username = connect_settings.value.customer_username
      subnet_ids        = connect_settings.value.subnet_ids
      vpc_id            = connect_settings.value.vpc_id
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  dynamic "vpc_settings" {
    for_each = var.vpc_settings
    content {
      subnet_ids = vpc_settings.value.subnet_ids
      vpc_id     = vpc_settings.value.vpc_id
    }
  }

}
