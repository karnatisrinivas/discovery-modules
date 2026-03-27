resource "aws_networkfirewall_firewall" "this" {
  delete_protection                 = var.delete_protection
  description                       = var.description
  firewall_policy_arn               = var.firewall_policy_arn
  firewall_policy_change_protection = var.firewall_policy_change_protection
  name                              = var.name
  subnet_change_protection          = var.subnet_change_protection
  tags                              = var.tags
  vpc_id                            = var.vpc_id

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration
    content {
      key_id = encryption_configuration.value.key_id
      type   = encryption_configuration.value.type
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping
    content {
      ip_address_type = subnet_mapping.value.ip_address_type
      subnet_id       = subnet_mapping.value.subnet_id
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

}
