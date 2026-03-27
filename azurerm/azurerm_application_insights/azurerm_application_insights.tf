resource "azurerm_application_insights" "this" {
  application_type    = var.application_type
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name

  disable_ip_masking                  = var.disable_ip_masking
  force_customer_storage_for_profiler = var.force_customer_storage_for_profiler
  internet_ingestion_enabled          = var.internet_ingestion_enabled
  internet_query_enabled              = var.internet_query_enabled
  local_authentication_disabled       = var.local_authentication_disabled
  retention_in_days                   = var.retention_in_days
  sampling_percentage                 = var.sampling_percentage
  tags                                = var.tags
  workspace_id                        = var.workspace_id
}
