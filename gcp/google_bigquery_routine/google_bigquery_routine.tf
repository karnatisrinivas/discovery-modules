resource "google_bigquery_routine" "this" {
  data_governance_type = var.data_governance_type
  dataset_id           = var.dataset_id
  definition_body      = var.definition_body
  description          = var.description
  determinism_level    = var.determinism_level
  imported_libraries   = var.imported_libraries
  language             = var.language
  return_table_type    = var.return_table_type
  return_type          = var.return_type
  routine_id           = var.routine_id
  routine_type         = var.routine_type

  dynamic "arguments" {
    for_each = var.arguments
    content {
      argument_kind = arguments.value.argument_kind
      data_type     = arguments.value.data_type
      mode          = arguments.value.mode
      name          = arguments.value.name
    }
  }

  dynamic "remote_function_options" {
    for_each = var.remote_function_options
    content {
      connection           = remote_function_options.value.connection
      endpoint             = remote_function_options.value.endpoint
      max_batching_rows    = remote_function_options.value.max_batching_rows
      user_defined_context = remote_function_options.value.user_defined_context
    }
  }

  dynamic "spark_options" {
    for_each = var.spark_options
    content {
      archive_uris    = spark_options.value.archive_uris
      connection      = spark_options.value.connection
      container_image = spark_options.value.container_image
      file_uris       = spark_options.value.file_uris
      jar_uris        = spark_options.value.jar_uris
      main_class      = spark_options.value.main_class
      main_file_uri   = spark_options.value.main_file_uri
      properties      = spark_options.value.properties
      py_file_uris    = spark_options.value.py_file_uris
      runtime_version = spark_options.value.runtime_version
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
