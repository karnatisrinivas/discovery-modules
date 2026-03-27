resource "google_monitoring_dashboard" "this" {
  dashboard_json = var.dashboard_json
}