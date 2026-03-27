variables {
  name               = "sample-memcache-instance"
  authorized_network = "projects/example-gcp-project/global/networks/default"
  labels = {
    "env" = "dev"
  }
  cpu_count        = 2
  memory_size_mb   = 1844
  node_count       = 1
  memcache_version = "MEMCACHE_1_5"
  maintenance_policy = [
    {
      day      = "SATURDAY"
      duration = 10800
    }
  ]
}

run "test" {
  command = apply
  assert {
    condition     = google_memcache_instance.this.name == "sample-memcache-instance"
    error_message = "google_memcache_instance did not create correctly"
  }
}