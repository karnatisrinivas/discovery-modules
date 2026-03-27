resource "azurerm_servicebus_subscription" "this" {
  name                                      = var.name
  topic_id                                  = var.topic_id
  max_delivery_count                        = var.max_delivery_count
  auto_delete_on_idle                       = var.auto_delete_on_idle
  default_message_ttl                       = var.default_message_ttl
  lock_duration                             = var.lock_duration
  dead_lettering_on_message_expiration      = var.dead_lettering_on_message_expiration
  dead_lettering_on_filter_evaluation_error = var.dead_lettering_on_filter_evaluation_error
  enable_batched_operations                 = var.enable_batched_operations
  requires_session                          = var.requires_session
  forward_to                                = var.forward_to
  status                                    = var.status
  client_scoped_subscription_enabled        = var.client_scoped_subscription_enabled
  dynamic "client_scoped_subscription" {
    for_each = var.client_scoped_subscription_enabled == true ? [1] : []
    content {
      client_id                               = var.client_id
      is_client_scoped_subscription_shareable = var.is_client_scoped_subscription_shareable
      is_client_scoped_subscription_durable   = var.is_client_scoped_subscription_durable
    }
  }
}

