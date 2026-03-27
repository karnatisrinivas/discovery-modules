data "aws_dms_replication_task" "this" {
  replication_task_id = var.replication_task_id
}
