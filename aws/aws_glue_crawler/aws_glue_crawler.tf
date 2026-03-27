resource "aws_glue_crawler" "this" {
  classifiers            = var.classifiers
  configuration          = var.configuration
  database_name          = var.database_name
  description            = var.description
  name                   = var.name
  role                   = var.role
  schedule               = var.schedule
  security_configuration = var.security_configuration
  table_prefix           = var.table_prefix
  tags                   = var.tags

  dynamic "catalog_target" {
    for_each = var.catalog_target
    content {
      connection_name     = catalog_target.value.connection_name
      database_name       = catalog_target.value.database_name
      dlq_event_queue_arn = catalog_target.value.dlq_event_queue_arn
      event_queue_arn     = catalog_target.value.event_queue_arn
      tables              = catalog_target.value.tables
    }
  }

  dynamic "delta_target" {
    for_each = var.delta_target
    content {
      connection_name           = delta_target.value.connection_name
      create_native_delta_table = delta_target.value.create_native_delta_table
      delta_tables              = delta_target.value.delta_tables
      write_manifest            = delta_target.value.write_manifest
    }
  }

  dynamic "dynamodb_target" {
    for_each = var.dynamodb_target
    content {
      path      = dynamodb_target.value.path
      scan_all  = dynamodb_target.value.scan_all
      scan_rate = dynamodb_target.value.scan_rate
    }
  }

  dynamic "hudi_target" {
    for_each = var.hudi_target
    content {
      connection_name         = hudi_target.value.connection_name
      exclusions              = hudi_target.value.exclusions
      maximum_traversal_depth = hudi_target.value.maximum_traversal_depth
      paths                   = hudi_target.value.paths
    }
  }

  dynamic "iceberg_target" {
    for_each = var.iceberg_target
    content {
      connection_name         = iceberg_target.value.connection_name
      exclusions              = iceberg_target.value.exclusions
      maximum_traversal_depth = iceberg_target.value.maximum_traversal_depth
      paths                   = iceberg_target.value.paths
    }
  }

  dynamic "jdbc_target" {
    for_each = var.jdbc_target
    content {
      connection_name            = jdbc_target.value.connection_name
      enable_additional_metadata = jdbc_target.value.enable_additional_metadata
      exclusions                 = jdbc_target.value.exclusions
      path                       = jdbc_target.value.path
    }
  }

  dynamic "lake_formation_configuration" {
    for_each = var.lake_formation_configuration
    content {
      account_id                     = lake_formation_configuration.value.account_id
      use_lake_formation_credentials = lake_formation_configuration.value.use_lake_formation_credentials
    }
  }

  dynamic "lineage_configuration" {
    for_each = var.lineage_configuration
    content {
      crawler_lineage_settings = lineage_configuration.value.crawler_lineage_settings
    }
  }

  dynamic "mongodb_target" {
    for_each = var.mongodb_target
    content {
      connection_name = mongodb_target.value.connection_name
      path            = mongodb_target.value.path
      scan_all        = mongodb_target.value.scan_all
    }
  }

  dynamic "recrawl_policy" {
    for_each = var.recrawl_policy
    content {
      recrawl_behavior = recrawl_policy.value.recrawl_behavior
    }
  }

  dynamic "s3_target" {
    for_each = var.s3_target
    content {
      connection_name     = s3_target.value.connection_name
      dlq_event_queue_arn = s3_target.value.dlq_event_queue_arn
      event_queue_arn     = s3_target.value.event_queue_arn
      exclusions          = s3_target.value.exclusions
      path                = s3_target.value.path
      sample_size         = s3_target.value.sample_size
    }
  }

  dynamic "schema_change_policy" {
    for_each = var.schema_change_policy
    content {
      delete_behavior = schema_change_policy.value.delete_behavior
      update_behavior = schema_change_policy.value.update_behavior
    }
  }

}
