resource "google_logging_organization_sink" "this" {
  description        = var.description
  destination        = var.destination
  disabled           = var.disabled
  filter             = var.filter
  include_children   = var.include_children
  intercept_children = var.intercept_children
  name               = var.name
  org_id             = var.org_id

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
