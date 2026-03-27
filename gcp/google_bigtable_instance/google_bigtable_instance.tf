resource "google_bigtable_instance" "this" {
  name = var.name

  dynamic "cluster" {
    for_each = var.cluster
    content {
      cluster_id   = cluster.value.cluster_id
      zone         = cluster.value.zone
      num_nodes    = cluster.value.num_nodes
      storage_type = cluster.value.storage_type
    }

  }

  deletion_protection = var.deletion_protection
}