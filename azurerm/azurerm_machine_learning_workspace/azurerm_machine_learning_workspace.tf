resource "azurerm_machine_learning_workspace" "this" {
  application_insights_id = var.application_insights_id
  key_vault_id            = var.key_vault_id
  location                = var.location
  name                    = var.name
  resource_group_name     = var.resource_group_name
  storage_account_id      = var.storage_account_id

  container_registry_id          = var.container_registry_id
  description                    = var.description
  friendly_name                  = var.friendly_name
  high_business_impact           = var.high_business_impact
  image_build_compute_name       = var.image_build_compute_name
  kind                           = var.kind
  primary_user_assigned_identity = var.primary_user_assigned_identity
  public_network_access_enabled  = var.public_network_access_enabled
  sku_name                       = var.sku_name
  tags                           = var.tags
  v1_legacy_mode_enabled         = var.v1_legacy_mode_enabled

  dynamic "identity" {
    for_each = var.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  dynamic "encryption" {
    for_each = var.encryption
    content {
      key_id                    = encryption.value.key_id
      key_vault_id              = encryption.value.key_vault_id
      user_assigned_identity_id = encryption.value.user_assigned_identity_id
    }
  }
  dynamic "managed_network" {
    for_each = var.managed_network
    content {
      isolation_mode = managed_network.value.isolation_mode
    }
  }
  dynamic "serverless_compute" {
    for_each = var.serverless_compute
    content {
      subnet_id         = serverless_compute.value.subnet_id
      public_ip_enabled = serverless_compute.value.public_ip_enabled
    }
  }
  dynamic "feature_store" {
    for_each = var.feature_store
    content {
      computer_spark_runtime_version = feature_store.value.computer_spark_runtime_version
      offline_connection_name        = feature_store.value.offline_connection_name
      online_connection_name         = feature_store.value.online_connection_name
    }
  }
}
