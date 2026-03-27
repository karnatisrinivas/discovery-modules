variables {
  name            = "node pool"
  cluster         = "cluster"
  node_count      = 3
  service_account = "acc"
}

run "test" {
  command = plan

  assert {
    condition     = google_container_node_pool.this.name == "node pool"
    error_message = "google_container_node_pool did not create correctly"
  }
}