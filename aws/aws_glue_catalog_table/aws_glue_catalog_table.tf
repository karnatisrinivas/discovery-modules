resource "aws_glue_catalog_table" "this" {
  database_name      = var.database_name
  name               = var.name
  description        = var.description
  owner              = var.owner
  parameters         = var.parameters
  retention          = var.retention
  table_type         = var.table_type
  view_expanded_text = var.view_expanded_text
  view_original_text = var.view_original_text

  # open_table_format_input (max_items = 1)
  dynamic "open_table_format_input" {
    for_each = var.open_table_format_input
    content {
      iceberg_input {
        metadata_operation = open_table_format_input.value.iceberg_input.metadata_operation
        version            = open_table_format_input.value.iceberg_input.version
      }
    }
  }

  # partition_index (max_items = 3)
  dynamic "partition_index" {
    for_each = var.partition_index
    content {
      index_name = partition_index.value.index_name
      keys       = partition_index.value.keys
    }
  }

  # partition_keys (if provided)
  dynamic "partition_keys" {
    for_each = var.partition_keys
    content {
      comment = partition_keys.value.comment
      name    = partition_keys.value.name
      type    = partition_keys.value.type
    }
  }

  # storage_descriptor (max_items = 1)
  dynamic "storage_descriptor" {
    for_each = var.storage_descriptor
    content {
      additional_locations      = contains(keys(storage_descriptor.value), "additional_locations") ? storage_descriptor.value.additional_locations : []
      bucket_columns            = storage_descriptor.value.bucket_columns
      compressed                = storage_descriptor.value.compressed
      input_format              = storage_descriptor.value.input_format
      location                  = storage_descriptor.value.location
      number_of_buckets         = storage_descriptor.value.number_of_buckets
      output_format             = storage_descriptor.value.output_format
      parameters                = storage_descriptor.value.parameters
      stored_as_sub_directories = storage_descriptor.value.stored_as_sub_directories

      # columns (if provided)
      dynamic "columns" {
        for_each = storage_descriptor.value.columns
        content {
          comment    = columns.value.comment
          name       = columns.value.name
          parameters = columns.value.parameters
          type       = columns.value.type
        }
      }

      # schema_reference (if provided)
      dynamic "schema_reference" {
        for_each = storage_descriptor.value.schema_reference
        content {
          schema_version_number = schema_reference.value.schema_version_number
          schema_id {
            schema_arn = schema_reference.value.schema_id.schema_arn
          }
        }
      }

      # ser_de_info (if provided)
      dynamic "ser_de_info" {
        for_each = storage_descriptor.value.ser_de_info == null ? [] : storage_descriptor.value.ser_de_info
        content {
          name                  = ser_de_info.value.name == "" ? null : ser_de_info.value.name
          parameters            = ser_de_info.value.parameters == {} ? null : ser_de_info.value.parameters
          serialization_library = ser_de_info.value.serialization_library == "" ? null : ser_de_info.value.serialization_library
        }
      }

      # skewed_info (if provided)
      dynamic "skewed_info" {
        for_each = storage_descriptor.value.skewed_info == null ? [] : storage_descriptor.value.skewed_info
        content {
          skewed_column_names               = skewed_info.value.skewed_column_names
          skewed_column_value_location_maps = skewed_info.value.skewed_column_value_location_maps
          skewed_column_values              = skewed_info.value.skewed_column_values
        }
      }

      # sort_columns (if provided)
      dynamic "sort_columns" {
        for_each = storage_descriptor.value.sort_columns
        content {
          column     = sort_columns.value.column
          sort_order = sort_columns.value.sort_order
        }
      }
    }
  }

  # target_table (max_items = 1)
  dynamic "target_table" {
    for_each = var.target_table
    content {
      catalog_id    = target_table.value.catalog_id
      database_name = target_table.value.database_name
      name          = target_table.value.name
      region        = target_table.value.region
    }
  }
}
