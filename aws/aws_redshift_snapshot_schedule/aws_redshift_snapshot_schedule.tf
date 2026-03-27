resource "aws_redshift_snapshot_schedule" "this" {
  identifier  = var.identifier
  definitions = var.definitions
  tags        = var.tags
}



