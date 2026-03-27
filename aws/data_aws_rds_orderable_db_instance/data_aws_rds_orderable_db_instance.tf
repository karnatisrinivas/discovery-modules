data "aws_rds_orderable_db_instance" "this" {
  engine = var.engine

  engine_latest_version      = var.engine_latest_version
  preferred_engine_versions  = var.preferred_engine_versions
  preferred_instance_classes = var.preferred_instance_classes
}
