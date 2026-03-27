resource "google_sql_database" "this" {
  name            = var.name
  instance        = var.instance
  deletion_policy = var.deletion_policy
  charset         = var.charset
  collation       = var.collation
}