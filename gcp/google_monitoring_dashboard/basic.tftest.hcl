variables {
  dashboard_json = <<EOF
{
  "displayName": "Demo Dashboard",
  "gridLayout": {
    "widgets": [
      {
        "blank": {}
      }
    ]
  }
}

EOF
}

run "test" {
  command = plan
  assert {
    condition     = google_monitoring_dashboard.this.dashboard_json != null
    error_message = "google_monitoring_dashboard unsucessful"
  }
}