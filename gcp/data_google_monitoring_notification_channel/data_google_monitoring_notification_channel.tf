data "google_monitoring_notification_channel" "this" {
  display_name = var.display_name
  labels       = var.labels
  type         = var.type
  user_labels  = var.user_labels

}
