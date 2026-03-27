variables {
  region             = "us-east-1"
  table_type         = "EXTERNAL_TABLE"
  database_name      = "example_database"
  parameters         = { "example" = "value" }
  retention          = 0
  view_expanded_text = "SELECT * FROM example_table_expanded"
  view_original_text = "SELECT * FROM example_table"
  description        = "Example Glue Catalog Table"
  name               = "example_table"
  owner              = "example_owner"

  open_table_format_input = [
    {
      iceberg_input = {
        metadata_operation = "CREATE" // Changed from "op1" to allowed value "CREATE"
        version            = "v1"
      }
    }
  ]

  partition_index = [
    {
      index_name = "index1"
      keys       = ["key1", "key2"]
    }
  ]

  partition_keys = [
    {
      comment = "Test partition key"
      name    = "partition_key"
      type    = "string"
    }
  ]

  storage_descriptor = [
    {
      additional_locations      = ["s3://bucket/additional"]
      bucket_columns            = ["bucket1"]
      compressed                = false
      input_format              = "org.apache.hadoop.mapred.TextInputFormat"
      location                  = "s3://bucket/path"
      number_of_buckets         = 1
      output_format             = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
      parameters                = { "param1" = "value1" }
      stored_as_sub_directories = false
      columns = [
        {
          comment    = "Column comment"
          name       = "col1"
          parameters = { "col_param" = "value" }
          type       = "string"
        }
      ]

      // Updated schema_reference: remove schema_version_id and only provide schema_id with schema_arn.
      schema_reference = [
        {
          schema_version_number = 1,
          schema_id = {
            schema_arn = "arn:aws:glue:us-east-1:123456789012:schema/example_schema"
          }
        }
      ]

      ser_de_info = [{
        name                  = "serde1"
        parameters            = { "serde_param" = "value" }
        serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
      }]

      skewed_info = [{
        skewed_column_names               = ["skew1"]
        skewed_column_value_location_maps = { "col1" = "s3://bucket/skew" }
        skewed_column_values              = ["value1"]
      }]

      sort_columns = [
        {
          column     = "col1"
          sort_order = 1
        }
      ]
    }
  ]

  target_table = [
    {
      catalog_id    = "123456789"
      database_name = "target_database"
      name          = "target_table"
      region        = "us-east-1"
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_glue_catalog_table.this.name != null
    error_message = "aws_glue_catalog_table was not successful"
  }
}
