resource "google_bigquery_table" "this" {
  clustering               = var.clustering
  dataset_id               = var.dataset_id
  deletion_protection      = var.deletion_protection
  description              = var.description
  expiration_time          = var.expiration_time
  friendly_name            = var.friendly_name
  labels                   = var.labels
  max_staleness            = var.max_staleness
  require_partition_filter = var.require_partition_filter
  resource_tags            = var.resource_tags
  schema                   = var.schema
  table_id                 = var.table_id
  table_metadata_view      = var.table_metadata_view

  dynamic "biglake_configuration" {
    for_each = var.biglake_configuration
    content {
      connection_id = biglake_configuration.value.connection_id
      file_format   = biglake_configuration.value.file_format
      storage_uri   = biglake_configuration.value.storage_uri
      table_format  = biglake_configuration.value.table_format
    }
  }

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration
    content {
      kms_key_name = encryption_configuration.value.kms_key_name
    }
  }

  dynamic "external_data_configuration" {
    for_each = var.external_data_configuration
    content {
      autodetect                = external_data_configuration.value.autodetect
      compression               = external_data_configuration.value.compression
      connection_id             = external_data_configuration.value.connection_id
      file_set_spec_type        = external_data_configuration.value.file_set_spec_type
      ignore_unknown_values     = external_data_configuration.value.ignore_unknown_values
      json_extension            = external_data_configuration.value.json_extension
      max_bad_records           = external_data_configuration.value.max_bad_records
      metadata_cache_mode       = external_data_configuration.value.metadata_cache_mode
      object_metadata           = external_data_configuration.value.object_metadata
      reference_file_schema_uri = external_data_configuration.value.reference_file_schema_uri
      schema                    = external_data_configuration.value.schema
      source_format             = external_data_configuration.value.source_format
      source_uris               = external_data_configuration.value.source_uris

      dynamic "avro_options" {
        for_each = external_data_configuration.value.avro_options
        content {
          use_avro_logical_types = avro_options.value.use_avro_logical_types
        }
      }

      dynamic "bigtable_options" {
        for_each = external_data_configuration.value.bigtable_options
        content {
          ignore_unspecified_column_families = bigtable_options.value.ignore_unspecified_column_families
          output_column_families_as_json     = bigtable_options.value.output_column_families_as_json
          read_rowkey_as_string              = bigtable_options.value.read_rowkey_as_string

          dynamic "column_family" {
            for_each = bigtable_options.value.column_family
            content {
              encoding         = column_family.value.encoding
              family_id        = column_family.value.family_id
              only_read_latest = column_family.value.only_read_latest
              type             = column_family.value.type

              dynamic "column" {
                for_each = column_family.value.column
                content {
                  encoding          = column.value.encoding
                  field_name        = column.value.field_name
                  only_read_latest  = column.value.only_read_latest
                  qualifier_encoded = column.value.qualifier_encoded
                  qualifier_string  = column.value.qualifier_string
                  type              = column.value.type
                }
              }

            }
          }

        }
      }

      dynamic "csv_options" {
        for_each = external_data_configuration.value.csv_options
        content {
          allow_jagged_rows     = csv_options.value.allow_jagged_rows
          allow_quoted_newlines = csv_options.value.allow_quoted_newlines
          encoding              = csv_options.value.encoding
          field_delimiter       = csv_options.value.field_delimiter
          quote                 = csv_options.value.quote
          skip_leading_rows     = csv_options.value.skip_leading_rows
        }
      }

      dynamic "google_sheets_options" {
        for_each = external_data_configuration.value.google_sheets_options
        content {
          range             = google_sheets_options.value.range
          skip_leading_rows = google_sheets_options.value.skip_leading_rows
        }
      }

      dynamic "hive_partitioning_options" {
        for_each = external_data_configuration.value.hive_partitioning_options
        content {
          mode                     = hive_partitioning_options.value.mode
          require_partition_filter = hive_partitioning_options.value.require_partition_filter
          source_uri_prefix        = hive_partitioning_options.value.source_uri_prefix
        }
      }

      dynamic "json_options" {
        for_each = external_data_configuration.value.json_options
        content {
          encoding = json_options.value.encoding
        }
      }

      dynamic "parquet_options" {
        for_each = external_data_configuration.value.parquet_options
        content {
          enable_list_inference = parquet_options.value.enable_list_inference
          enum_as_string        = parquet_options.value.enum_as_string
        }
      }

    }
  }

  dynamic "materialized_view" {
    for_each = var.materialized_view
    content {
      allow_non_incremental_definition = materialized_view.value.allow_non_incremental_definition
      enable_refresh                   = materialized_view.value.enable_refresh
      query                            = materialized_view.value.query
      refresh_interval_ms              = materialized_view.value.refresh_interval_ms
    }
  }

  dynamic "range_partitioning" {
    for_each = var.range_partitioning
    content {
      field = range_partitioning.value.field

      dynamic "range" {
        for_each = range_partitioning.value.range
        content {
          end      = range.value.end
          interval = range.value.interval
          start    = range.value.start
        }
      }

    }
  }

  dynamic "table_constraints" {
    for_each = var.table_constraints
    content {
      dynamic "foreign_keys" {
        for_each = table_constraints.value.foreign_keys
        content {
          name = foreign_keys.value.name

          dynamic "column_references" {
            for_each = foreign_keys.value.column_references
            content {
              referenced_column  = column_references.value.referenced_column
              referencing_column = column_references.value.referencing_column
            }
          }

          dynamic "referenced_table" {
            for_each = foreign_keys.value.referenced_table
            content {
              dataset_id = referenced_table.value.dataset_id
              project_id = referenced_table.value.project_id
              table_id   = referenced_table.value.table_id
            }
          }

        }
      }

      dynamic "primary_key" {
        for_each = table_constraints.value.primary_key
        content {
          columns = primary_key.value.columns
        }
      }

    }
  }

  dynamic "table_replication_info" {
    for_each = var.table_replication_info
    content {
      replication_interval_ms = table_replication_info.value.replication_interval_ms
      source_dataset_id       = table_replication_info.value.source_dataset_id
      source_project_id       = table_replication_info.value.source_project_id
      source_table_id         = table_replication_info.value.source_table_id
    }
  }

  dynamic "time_partitioning" {
    for_each = var.time_partitioning
    content {
      expiration_ms            = time_partitioning.value.expiration_ms
      field                    = time_partitioning.value.field
      require_partition_filter = var.require_partition_filter != null ? null : time_partitioning.value.require_partition_filter
      type                     = time_partitioning.value.type
    }
  }

  dynamic "view" {
    for_each = var.view
    content {
      query          = view.value.query
      use_legacy_sql = view.value.use_legacy_sql
    }
  }

}
