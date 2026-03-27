resource "aws_keyspaces_table" "this" {
  keyspace_name        = var.keyspace_name
  table_name           = var.table_name
  default_time_to_live = var.default_time_to_live
  tags                 = var.tags

  dynamic "capacity_specification" {
    for_each = var.capacity_specification
    content {
      read_capacity_units  = capacity_specification.value.read_capacity_units
      throughput_mode      = capacity_specification.value.throughput_mode
      write_capacity_units = capacity_specification.value.write_capacity_units
    }
  }

  dynamic "client_side_timestamps" {
    for_each = var.client_side_timestamps
    content {
      status = "ENABLED"
    }
  }

  dynamic "comment" {
    for_each = var.comment
    content {
      message = comment.value.message
    }
  }

  dynamic "encryption_specification" {
    for_each = var.encryption_specification
    content {
      kms_key_identifier = encryption_specification.value.kms_key_identifier
      type               = encryption_specification.value.type
    }
  }

  dynamic "point_in_time_recovery" {
    for_each = var.point_in_time_recovery
    content {
      status = point_in_time_recovery.value.status
    }
  }

  dynamic "schema_definition" {
    for_each = var.schema_definition
    content {
      column {
        name = schema_definition.value.column.name
        type = schema_definition.value.column.type
      }
      partition_key {
        name = schema_definition.value.partition_key.name
      }
      clustering_key {
        name     = schema_definition.value.clustering_key.name
        order_by = schema_definition.value.clustering_key.order_by
      }
      static_column {
        name = schema_definition.value.static_column.name
      }
    }
  }

  dynamic "ttl" {
    for_each = var.ttl
    content {
      status = "ENABLED"
    }
  }
}


