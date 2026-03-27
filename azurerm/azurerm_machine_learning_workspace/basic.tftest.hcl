variables {
  subscription_id                = "12345678-1234-9876-4563-123456789012"
  create_resource_group          = false
  location                       = "eastus2"
  container_registry_id          = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.ContainerRegistry/registries/registryName"
  friendly_name                  = "friendly_name"
  image_build_compute_name       = "image_build_compute_name"
  primary_user_assigned_identity = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.ManagedIdentity/userAssignedIdentities/userAssignedIdentityValue"
  resource_group_name            = "resource_group_name"
  application_insights_id        = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Insights/components/componentName"
  description                    = "description"
  high_business_impact           = false
  kind                           = "Default"
  public_network_access_enabled  = false
  key_vault_id                   = "/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.KeyVault/vaults/{key-vault-name}"
  sku_name                       = "Basic"
  storage_account_id             = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Storage/storageAccounts/storageAccountValue"
  v1_legacy_mode_enabled         = false
  name                           = "asd"
  tags                           = {}

  identity = [
    {
      type         = "SystemAssigned"
      identity_ids = []
    },
  ]
  encryption         = []
  managed_network    = []
  serverless_compute = []
  feature_store = [
    {
      computer_spark_runtime_version = "computer_spark_runtime_version"
      offline_connection_name        = "offline_connection_name"
      online_connection_name         = "online_connection_name"
    }
  ]
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_machine_learning_workspace.this.name != null
    error_message = "azurerm_machine_learning_workspace was not succesful"
  }
}
