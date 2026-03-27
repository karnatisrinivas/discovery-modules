resource "aws_api_gateway_stage" "this" {
  deployment_id = var.deployment_id
  rest_api_id   = var.rest_api_id
  stage_name    = var.stage_name

  cache_cluster_enabled = var.cache_cluster_enabled
  cache_cluster_size    = var.cache_cluster_size == "" ? null : var.cache_cluster_size
  client_certificate_id = var.client_certificate_id
  description           = var.description
  documentation_version = var.documentation_version
  tags                  = var.tags
  variables             = var.variables
  xray_tracing_enabled  = var.xray_tracing_enabled

  dynamic "access_log_settings" {
    for_each = var.access_log_settings
    content {
      destination_arn = access_log_settings.value.destination_arn
      format          = access_log_settings.value.format
    }
  }

  dynamic "canary_settings" {
    for_each = length(var.canary_settings) > 0 ? [var.canary_settings] : []
    content {
      deployment_id            = canary_settings.value.deployment_id
      percent_traffic          = canary_settings.value.percent_traffic
      stage_variable_overrides = canary_settings.value.stage_variable_overrides
      use_stage_cache          = canary_settings.value.use_stage_cache
    }
  }
}
