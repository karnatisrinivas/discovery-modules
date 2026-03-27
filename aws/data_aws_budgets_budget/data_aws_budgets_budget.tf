data "aws_budgets_budget" "this" {
  name = var.name

  name_prefix = var.name_prefix
}
