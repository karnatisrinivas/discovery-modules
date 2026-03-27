resource "google_firestore_index" "this" {
  api_scope   = var.api_scope
  collection  = var.collection
  database    = var.database
  density     = var.density
  multikey    = var.multikey
  query_scope = var.query_scope

  dynamic "fields" {
    for_each = var.fields
    content {
      array_config = fields.value.array_config
      field_path   = fields.value.field_path
      order        = fields.value.order

      dynamic "vector_config" {
        for_each = fields.value.vector_config
        content {
          dimension = vector_config.value.dimension

          dynamic "flat" {
            for_each = vector_config.value.flat
            content {
            }
          }

        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
