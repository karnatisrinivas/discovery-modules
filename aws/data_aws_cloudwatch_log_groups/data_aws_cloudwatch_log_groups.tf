data "aws_cloudwatch_log_groups" "this" {

  log_group_name_prefix = var.log_group_name_prefix
}
