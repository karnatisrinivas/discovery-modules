
# Create a MongoDB collection
resource "azurerm_cosmosdb_mongo_collection" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  account_name        = var.account_name
  database_name       = var.database_name
  shard_key           = var.shard_key
  default_ttl_seconds = var.default_ttl_seconds
  throughput          = var.throughput


  index {
    keys   = var.keys
    unique = var.unique
  }
}

