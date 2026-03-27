variables {
  region      = "us-east-1"
  description = "somedescription"
  name        = "somename"
  parameters = {
    "someparameter" = "somevalue"
  }
  tags = {
    "sometag" = "somevalue"
  }
  create_table_default_permission = [
    {
      permissions = ["ALL"]
      principal = {
        data_lake_principal_identifier = "arn:aws:iam::123456789012:user/someuser"
      }
    }
  ]
  federated_database = [
    {
      connection_name = "someconnectionname"
      identifier      = "someidentifier"
    }
  ]
  target_database = [
    {
      catalog_id    = "somecatalogid"
      database_name = "somedatabasename"
      region        = "someregion"
    }
  ]
}
run "test" {
  command = plan
  assert {
    condition     = aws_glue_catalog_database.this.name != null
    error_message = "aws_glue_catalog_database was not succesful"
  }
}
