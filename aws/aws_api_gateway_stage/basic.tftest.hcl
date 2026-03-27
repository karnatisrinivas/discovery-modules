variables {
  client_certificate_id = ""
  description           = ""
  tags                  = {}
  cache_cluster_enabled = false
  deployment_id         = ""
  documentation_version = ""
  rest_api_id           = ""
  stage_name            = ""
  variables             = {}
  xray_tracing_enabled  = false
  cache_cluster_size    = ""
  access_log_settings   = []
  canary_settings       = []
}
run "test" {
  command = plan
  assert {
    condition     = aws_api_gateway_stage.this.description != null
    error_message = "aws_api_gateway_stage was not succesful"
  }
}
