data "aws_ebs_snapshot_ids" "this" {

  owners                 = var.owners
  restorable_by_user_ids = var.restorable_by_user_ids
}
