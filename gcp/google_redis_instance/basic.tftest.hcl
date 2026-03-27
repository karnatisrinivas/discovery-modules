variables {
  name               = "example-redis"
  tier               = "BASIC"
  memory_size_gb     = 3
  authorized_network = "default"
  redis_version      = "REDIS_7_0"
  display_name       = "example"
  auth_enabled       = true
  connect_mode       = "DIRECT_PEERING"
  labels = {
    "kemcho" = "hello"
  }
  maintenance_policy = [{
    description = "maintenance"

    weekly_maintenance_window = [
      {
        day        = "MONDAY"
        start_time = null
      }
    ]
  }]

  persistence_config = [
    {
      persistence_mode        = "RDB"
      rdb_snapshot_period     = "ONE_HOUR"
      rdb_snapshot_start_time = "2014-10-02T15:01:23Z"
    }
  ]

  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = "READ_REPLICAS_DISABLED"
  replica_count           = 0
  secondary_ip_range      = "0.0.0.0/28"
  customer_managed_key    = null
  location_id             = ""
  alternative_location_id = null
  reserved_ip_range       = "0.0.0.0/0"
  redis_configs           = {}
  maintenance_version     = "v1"
}

run "test" {
  command = plan
  assert {
    condition     = google_redis_instance.this.name == "example-redis"
    error_message = "google_redis_instance did not create correctly"
  }
}