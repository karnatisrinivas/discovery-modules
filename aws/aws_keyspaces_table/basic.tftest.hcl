variables {
  keyspace_name        = "thisismykeyspace"
  table_name           = "thisismytable"
  default_time_to_live = 1
  tags                 = {}
  region               = "us-east-1"
  order_by             = "ASC"
  capacity_specification = [{
    read_capacity_units  = 1
    throughput_mode      = "PAY_PER_REQUEST"
    write_capacity_units = 1
  }]

  client_side_timestamps = [
    "ENABLED" # This should be a string value directly
  ]

  comment = [{
    message = "this is a message"
  }]

  point_in_time_recovery = [{
    status = "DISABLED"
  }]

  schema_definition = [{
    column = {
      name = "thisisacolumn"
      type = "text"
    }
    partition_key = {
      name = "thisisapartition"
    }
    clustering_key = {
      name     = "thisisaclustering"
      order_by = "ASC" # Ensure this has a valid value
    }
    static_column = {
      name = "thisisastatic"
    }
  }]

  ttl = [{
    status = "ENABLED" # Assign a valid value
  }]

  encryption_specification = [{
    kms_key_identifier = null
    type               = null
  }]
}

run "test" {
  command = plan
  assert {
    condition     = aws_keyspaces_table.this.table_name == "thisismytable"
    error_message = "Test for AWS Keyspaces Table did not pass."
  }
}