data "aws_dms_replication_instance" "this" {
  replication_instance_id = var.replication_instance_id
}
