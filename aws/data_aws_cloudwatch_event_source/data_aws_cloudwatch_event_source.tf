data "aws_cloudwatch_event_source" "this" {

  name_prefix = var.name_prefix
}
