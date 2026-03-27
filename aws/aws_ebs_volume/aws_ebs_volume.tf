resource "aws_ebs_volume" "this" {
  availability_zone    = var.availability_zone
  encrypted            = var.encrypted
  final_snapshot       = var.final_snapshot
  iops                 = var.type == "gp2" ? null : var.iops
  multi_attach_enabled = var.multi_attach_enabled
  size                 = var.size
  snapshot_id          = var.snapshot_id
  outpost_arn          = var.outpost_arn
  type                 = var.type
  kms_key_id           = var.kms_key_id
  tags                 = var.tags
  throughput           = var.throughput == 0 ? null : var.throughput
}
