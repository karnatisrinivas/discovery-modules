resource "aws_kinesis_firehose_delivery_stream" "this" {
  destination = var.destination
  name        = var.name
  tags        = var.tags

  dynamic "elasticsearch_configuration" {
    for_each = var.elasticsearch_configuration
    content {
      buffering_interval    = elasticsearch_configuration.value.buffering_interval
      buffering_size        = elasticsearch_configuration.value.buffering_size
      cluster_endpoint      = elasticsearch_configuration.value.cluster_endpoint
      domain_arn            = elasticsearch_configuration.value.domain_arn
      index_name            = elasticsearch_configuration.value.index_name
      index_rotation_period = elasticsearch_configuration.value.index_rotation_period
      retry_duration        = elasticsearch_configuration.value.retry_duration
      role_arn              = elasticsearch_configuration.value.role_arn
      s3_backup_mode        = elasticsearch_configuration.value.s3_backup_mode
      type_name             = elasticsearch_configuration.value.type_name

      dynamic "cloudwatch_logging_options" {
        for_each = elasticsearch_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "processing_configuration" {
        for_each = elasticsearch_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = elasticsearch_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "vpc_config" {
        for_each = elasticsearch_configuration.value.vpc_config
        content {
          role_arn           = vpc_config.value.role_arn
          security_group_ids = vpc_config.value.security_group_ids
          subnet_ids         = vpc_config.value.subnet_ids
        }
      }

    }
  }

  dynamic "extended_s3_configuration" {
    for_each = var.extended_s3_configuration
    content {
      bucket_arn          = extended_s3_configuration.value.bucket_arn
      buffering_interval  = extended_s3_configuration.value.buffering_interval
      buffering_size      = extended_s3_configuration.value.buffering_size
      compression_format  = extended_s3_configuration.value.compression_format
      custom_time_zone    = extended_s3_configuration.value.custom_time_zone
      error_output_prefix = extended_s3_configuration.value.error_output_prefix
      file_extension      = extended_s3_configuration.value.file_extension
      kms_key_arn         = extended_s3_configuration.value.kms_key_arn
      prefix              = extended_s3_configuration.value.prefix
      role_arn            = extended_s3_configuration.value.role_arn
      s3_backup_mode      = extended_s3_configuration.value.s3_backup_mode

      dynamic "cloudwatch_logging_options" {
        for_each = extended_s3_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "data_format_conversion_configuration" {
        for_each = extended_s3_configuration.value.data_format_conversion_configuration
        content {
          enabled = data_format_conversion_configuration.value.enabled

          dynamic "input_format_configuration" {
            for_each = data_format_conversion_configuration.value.input_format_configuration
            content {
              dynamic "deserializer" {
                for_each = input_format_configuration.value.deserializer
                content {
                  dynamic "hive_json_ser_de" {
                    for_each = deserializer.value.hive_json_ser_de
                    content {
                      timestamp_formats = hive_json_ser_de.value.timestamp_formats
                    }
                  }

                  dynamic "open_x_json_ser_de" {
                    for_each = deserializer.value.open_x_json_ser_de
                    content {
                      case_insensitive                         = open_x_json_ser_de.value.case_insensitive
                      column_to_json_key_mappings              = open_x_json_ser_de.value.column_to_json_key_mappings
                      convert_dots_in_json_keys_to_underscores = open_x_json_ser_de.value.convert_dots_in_json_keys_to_underscores
                    }
                  }

                }
              }

            }
          }

          dynamic "output_format_configuration" {
            for_each = data_format_conversion_configuration.value.output_format_configuration
            content {
              dynamic "serializer" {
                for_each = output_format_configuration.value.serializer
                content {
                  dynamic "orc_ser_de" {
                    for_each = serializer.value.orc_ser_de
                    content {
                      block_size_bytes                        = orc_ser_de.value.block_size_bytes
                      bloom_filter_columns                    = orc_ser_de.value.bloom_filter_columns
                      bloom_filter_false_positive_probability = orc_ser_de.value.bloom_filter_false_positive_probability
                      compression                             = orc_ser_de.value.compression
                      dictionary_key_threshold                = orc_ser_de.value.dictionary_key_threshold
                      enable_padding                          = orc_ser_de.value.enable_padding
                      format_version                          = orc_ser_de.value.format_version
                      padding_tolerance                       = orc_ser_de.value.padding_tolerance
                      row_index_stride                        = orc_ser_de.value.row_index_stride
                      stripe_size_bytes                       = orc_ser_de.value.stripe_size_bytes
                    }
                  }

                  dynamic "parquet_ser_de" {
                    for_each = serializer.value.parquet_ser_de
                    content {
                      block_size_bytes              = parquet_ser_de.value.block_size_bytes
                      compression                   = parquet_ser_de.value.compression
                      enable_dictionary_compression = parquet_ser_de.value.enable_dictionary_compression
                      max_padding_bytes             = parquet_ser_de.value.max_padding_bytes
                      page_size_bytes               = parquet_ser_de.value.page_size_bytes
                      writer_version                = parquet_ser_de.value.writer_version
                    }
                  }

                }
              }

            }
          }

          dynamic "schema_configuration" {
            for_each = data_format_conversion_configuration.value.schema_configuration
            content {
              catalog_id    = schema_configuration.value.catalog_id
              database_name = schema_configuration.value.database_name
              region        = schema_configuration.value.region
              role_arn      = schema_configuration.value.role_arn
              table_name    = schema_configuration.value.table_name
              version_id    = schema_configuration.value.version_id
            }
          }

        }
      }

      dynamic "dynamic_partitioning_configuration" {
        for_each = extended_s3_configuration.value.dynamic_partitioning_configuration
        content {
          enabled        = dynamic_partitioning_configuration.value.enabled
          retry_duration = dynamic_partitioning_configuration.value.retry_duration
        }
      }

      dynamic "processing_configuration" {
        for_each = extended_s3_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_backup_configuration" {
        for_each = extended_s3_configuration.value.s3_backup_configuration
        content {
          bucket_arn          = s3_backup_configuration.value.bucket_arn
          buffering_interval  = s3_backup_configuration.value.buffering_interval
          buffering_size      = s3_backup_configuration.value.buffering_size
          compression_format  = s3_backup_configuration.value.compression_format
          error_output_prefix = s3_backup_configuration.value.error_output_prefix
          kms_key_arn         = s3_backup_configuration.value.kms_key_arn
          prefix              = s3_backup_configuration.value.prefix
          role_arn            = s3_backup_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_backup_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

    }
  }

  dynamic "http_endpoint_configuration" {
    for_each = var.http_endpoint_configuration
    content {
      access_key         = http_endpoint_configuration.value.access_key
      buffering_interval = http_endpoint_configuration.value.buffering_interval
      buffering_size     = http_endpoint_configuration.value.buffering_size
      name               = http_endpoint_configuration.value.name
      retry_duration     = http_endpoint_configuration.value.retry_duration
      role_arn           = http_endpoint_configuration.value.role_arn
      s3_backup_mode     = http_endpoint_configuration.value.s3_backup_mode
      url                = http_endpoint_configuration.value.url

      dynamic "cloudwatch_logging_options" {
        for_each = http_endpoint_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "processing_configuration" {
        for_each = http_endpoint_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "request_configuration" {
        for_each = http_endpoint_configuration.value.request_configuration
        content {
          content_encoding = request_configuration.value.content_encoding

          dynamic "common_attributes" {
            for_each = request_configuration.value.common_attributes
            content {
              name  = common_attributes.value.name
              value = common_attributes.value.value
            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = http_endpoint_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "secrets_manager_configuration" {
        for_each = http_endpoint_configuration.value.secrets_manager_configuration
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }

    }
  }

  dynamic "iceberg_configuration" {
    for_each = var.iceberg_configuration
    content {
      buffering_interval = iceberg_configuration.value.buffering_interval
      buffering_size     = iceberg_configuration.value.buffering_size
      catalog_arn        = iceberg_configuration.value.catalog_arn
      retry_duration     = iceberg_configuration.value.retry_duration
      role_arn           = iceberg_configuration.value.role_arn
      s3_backup_mode     = iceberg_configuration.value.s3_backup_mode

      dynamic "cloudwatch_logging_options" {
        for_each = iceberg_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "destination_table_configuration" {
        for_each = iceberg_configuration.value.destination_table_configuration
        content {
          database_name          = destination_table_configuration.value.database_name
          s3_error_output_prefix = destination_table_configuration.value.s3_error_output_prefix
          table_name             = destination_table_configuration.value.table_name
          unique_keys            = destination_table_configuration.value.unique_keys
        }
      }

      dynamic "processing_configuration" {
        for_each = iceberg_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = iceberg_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

    }
  }

  dynamic "kinesis_source_configuration" {
    for_each = var.kinesis_source_configuration
    content {
      kinesis_stream_arn = kinesis_source_configuration.value.kinesis_stream_arn
      role_arn           = kinesis_source_configuration.value.role_arn
    }
  }

  dynamic "msk_source_configuration" {
    for_each = var.msk_source_configuration
    content {
      msk_cluster_arn     = msk_source_configuration.value.msk_cluster_arn
      read_from_timestamp = msk_source_configuration.value.read_from_timestamp
      topic_name          = msk_source_configuration.value.topic_name

      dynamic "authentication_configuration" {
        for_each = msk_source_configuration.value.authentication_configuration
        content {
          connectivity = authentication_configuration.value.connectivity
          role_arn     = authentication_configuration.value.role_arn
        }
      }

    }
  }

  dynamic "opensearch_configuration" {
    for_each = var.opensearch_configuration
    content {
      buffering_interval    = opensearch_configuration.value.buffering_interval
      buffering_size        = opensearch_configuration.value.buffering_size
      cluster_endpoint      = opensearch_configuration.value.cluster_endpoint
      domain_arn            = opensearch_configuration.value.domain_arn
      index_name            = opensearch_configuration.value.index_name
      index_rotation_period = opensearch_configuration.value.index_rotation_period
      retry_duration        = opensearch_configuration.value.retry_duration
      role_arn              = opensearch_configuration.value.role_arn
      s3_backup_mode        = opensearch_configuration.value.s3_backup_mode
      type_name             = opensearch_configuration.value.type_name

      dynamic "cloudwatch_logging_options" {
        for_each = opensearch_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "document_id_options" {
        for_each = opensearch_configuration.value.document_id_options
        content {
          default_document_id_format = document_id_options.value.default_document_id_format
        }
      }

      dynamic "processing_configuration" {
        for_each = opensearch_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = opensearch_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "vpc_config" {
        for_each = opensearch_configuration.value.vpc_config
        content {
          role_arn           = vpc_config.value.role_arn
          security_group_ids = vpc_config.value.security_group_ids
          subnet_ids         = vpc_config.value.subnet_ids
        }
      }

    }
  }

  dynamic "opensearchserverless_configuration" {
    for_each = var.opensearchserverless_configuration
    content {
      buffering_interval  = opensearchserverless_configuration.value.buffering_interval
      buffering_size      = opensearchserverless_configuration.value.buffering_size
      collection_endpoint = opensearchserverless_configuration.value.collection_endpoint
      index_name          = opensearchserverless_configuration.value.index_name
      retry_duration      = opensearchserverless_configuration.value.retry_duration
      role_arn            = opensearchserverless_configuration.value.role_arn
      s3_backup_mode      = opensearchserverless_configuration.value.s3_backup_mode

      dynamic "cloudwatch_logging_options" {
        for_each = opensearchserverless_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "processing_configuration" {
        for_each = opensearchserverless_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = opensearchserverless_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "vpc_config" {
        for_each = opensearchserverless_configuration.value.vpc_config
        content {
          role_arn           = vpc_config.value.role_arn
          security_group_ids = vpc_config.value.security_group_ids
          subnet_ids         = vpc_config.value.subnet_ids
        }
      }

    }
  }

  dynamic "redshift_configuration" {
    for_each = var.redshift_configuration
    content {
      cluster_jdbcurl    = redshift_configuration.value.cluster_jdbcurl
      copy_options       = redshift_configuration.value.copy_options
      data_table_columns = redshift_configuration.value.data_table_columns
      data_table_name    = redshift_configuration.value.data_table_name
      password           = redshift_configuration.value.password
      retry_duration     = redshift_configuration.value.retry_duration
      role_arn           = redshift_configuration.value.role_arn
      s3_backup_mode     = redshift_configuration.value.s3_backup_mode
      username           = redshift_configuration.value.username

      dynamic "cloudwatch_logging_options" {
        for_each = redshift_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "processing_configuration" {
        for_each = redshift_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_backup_configuration" {
        for_each = redshift_configuration.value.s3_backup_configuration
        content {
          bucket_arn          = s3_backup_configuration.value.bucket_arn
          buffering_interval  = s3_backup_configuration.value.buffering_interval
          buffering_size      = s3_backup_configuration.value.buffering_size
          compression_format  = s3_backup_configuration.value.compression_format
          error_output_prefix = s3_backup_configuration.value.error_output_prefix
          kms_key_arn         = s3_backup_configuration.value.kms_key_arn
          prefix              = s3_backup_configuration.value.prefix
          role_arn            = s3_backup_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_backup_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = redshift_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "secrets_manager_configuration" {
        for_each = redshift_configuration.value.secrets_manager_configuration
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }

    }
  }

  dynamic "server_side_encryption" {
    for_each = var.server_side_encryption
    content {
      enabled  = server_side_encryption.value.enabled
      key_arn  = server_side_encryption.value.key_arn
      key_type = server_side_encryption.value.key_type
    }
  }

  dynamic "snowflake_configuration" {
    for_each = var.snowflake_configuration
    content {
      account_url          = snowflake_configuration.value.account_url
      buffering_interval   = snowflake_configuration.value.buffering_interval
      buffering_size       = snowflake_configuration.value.buffering_size
      content_column_name  = snowflake_configuration.value.content_column_name
      data_loading_option  = snowflake_configuration.value.data_loading_option
      database             = snowflake_configuration.value.database
      key_passphrase       = snowflake_configuration.value.key_passphrase
      metadata_column_name = snowflake_configuration.value.metadata_column_name
      private_key          = snowflake_configuration.value.private_key
      retry_duration       = snowflake_configuration.value.retry_duration
      role_arn             = snowflake_configuration.value.role_arn
      s3_backup_mode       = snowflake_configuration.value.s3_backup_mode
      schema               = snowflake_configuration.value.schema
      table                = snowflake_configuration.value.table
      user                 = snowflake_configuration.value.user

      dynamic "cloudwatch_logging_options" {
        for_each = snowflake_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "processing_configuration" {
        for_each = snowflake_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = snowflake_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "secrets_manager_configuration" {
        for_each = snowflake_configuration.value.secrets_manager_configuration
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }

      dynamic "snowflake_role_configuration" {
        for_each = snowflake_configuration.value.snowflake_role_configuration
        content {
          enabled        = snowflake_role_configuration.value.enabled
          snowflake_role = snowflake_role_configuration.value.snowflake_role
        }
      }

      dynamic "snowflake_vpc_configuration" {
        for_each = snowflake_configuration.value.snowflake_vpc_configuration
        content {
          private_link_vpce_id = snowflake_vpc_configuration.value.private_link_vpce_id
        }
      }

    }
  }

  dynamic "splunk_configuration" {
    for_each = var.splunk_configuration
    content {
      buffering_interval         = splunk_configuration.value.buffering_interval
      buffering_size             = splunk_configuration.value.buffering_size
      hec_acknowledgment_timeout = splunk_configuration.value.hec_acknowledgment_timeout
      hec_endpoint               = splunk_configuration.value.hec_endpoint
      hec_endpoint_type          = splunk_configuration.value.hec_endpoint_type
      hec_token                  = splunk_configuration.value.hec_token
      retry_duration             = splunk_configuration.value.retry_duration
      s3_backup_mode             = splunk_configuration.value.s3_backup_mode

      dynamic "cloudwatch_logging_options" {
        for_each = splunk_configuration.value.cloudwatch_logging_options
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }

      dynamic "processing_configuration" {
        for_each = splunk_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type

              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }

            }
          }

        }
      }

      dynamic "s3_configuration" {
        for_each = splunk_configuration.value.s3_configuration
        content {
          bucket_arn          = s3_configuration.value.bucket_arn
          buffering_interval  = s3_configuration.value.buffering_interval
          buffering_size      = s3_configuration.value.buffering_size
          compression_format  = s3_configuration.value.compression_format
          error_output_prefix = s3_configuration.value.error_output_prefix
          kms_key_arn         = s3_configuration.value.kms_key_arn
          prefix              = s3_configuration.value.prefix
          role_arn            = s3_configuration.value.role_arn

          dynamic "cloudwatch_logging_options" {
            for_each = s3_configuration.value.cloudwatch_logging_options
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }

        }
      }

      dynamic "secrets_manager_configuration" {
        for_each = splunk_configuration.value.secrets_manager_configuration
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }

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
