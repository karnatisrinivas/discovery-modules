resource "aws_xray_group" "this" {
  group_name        = var.group_name
  filter_expression = var.filter_expression

  dynamic "insights_configuration" {
    for_each = var.insights_configuration
    content {
      insights_enabled      = insights_configuration.value.insights_enabled
      notifications_enabled = insights_configuration.value.notifications_enabled
    }
  }
  tags = var.tags
}
