data "aws_neptune_orderable_db_instance" "this" {

  engine                     = var.engine
  license_model              = var.license_model
  preferred_instance_classes = var.preferred_instance_classes
}
