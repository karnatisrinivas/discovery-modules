#tftest.hcl
variables {
  name                = "test-cosmosdb-mongodb-collection"
  resource_group_name = "test-cosmosdb-mongodb-collection-rg"
  account_name        = "test-cosmosdb-mongodb-account"
  database_name       = "test-cosmosdb-mongodb-database"
  shard_key           = "unqiueKey"
}

run "validate" {
  command = plan
  assert {
    condition     = azurerm_cosmosdb_mongo_collection.this.name == "test-cosmosdb-mongodb-collection"
    error_message = "failed to execute plan for cosmosdb mongodb collection"
  }
}