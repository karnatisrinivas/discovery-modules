variables {
  name           = "test-table"
  billing_mode   = "PROVISIONED"
  hash_key       = "id"
  range_key      = "id"
  read_capacity  = 1
  write_capacity = 1
  attribute = [
    {
      name = "id"
      type = "S"
    }
  ]

  global_secondary_index = [
    {
      name            = "id-index"
      hash_key        = "id"
      range_key       = null
      projection_type = "ALL"
      read_capacity   = 5
      write_capacity  = 5
    }
  ]

  local_secondary_index = [
    {
      name            = "id-index"
      hash_key        = "id"
      range_key       = "id"
      projection_type = "ALL"
    }
  ]

  point_in_time_recovery = [
    {
      enabled = true
    }
  ]

  server_side_encryption = [
    {
      enabled     = true,
      kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012"
    }
  ]

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  ttl = [
    {
      attribute_name = "ttl"
      enabled        = true
    }
  ]

  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

  timeouts = {
    create = "10m"
    update = "10m"
    delete = "10m"
  }

}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_dynamodb_table.this.name == "test-table"
    error_message = "AWS DynamoDB Table name is not correct"
  }
}