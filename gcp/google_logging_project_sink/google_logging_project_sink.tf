resource "google_logging_project_sink" "this" {
  custom_writer_identity = var.custom_writer_identity
  description            = var.description
  destination            = var.destination
  disabled               = var.disabled
  filter                 = var.filter
  name                   = var.name
  unique_writer_identity = var.unique_writer_identity

  dynamic "bigquery_options" {
    for_each = var.bigquery_options
    content {
      use_partitioned_tables = bigquery_options.value.use_partitioned_tables
    }
  }

  dynamic "exclusions" {
    for_each = var.exclusions
    content {
      description = exclusions.value.description
      disabled    = exclusions.value.disabled
      filter      = exclusions.value.filter
      name        = exclusions.value.name
    }
  }

}
