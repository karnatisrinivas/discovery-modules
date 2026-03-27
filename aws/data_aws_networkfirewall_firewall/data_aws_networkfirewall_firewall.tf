data "aws_networkfirewall_firewall" "this" {
  arn  = var.arn
  name = var.name
}
