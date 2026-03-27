data "aws_resourcegroupstaggingapi_resources" "this" {

  exclude_compliant_resources = var.exclude_compliant_resources
  include_compliance_details  = var.include_compliance_details
  resource_arn_list           = var.resource_arn_list
  resource_type_filters       = var.resource_type_filters
}
