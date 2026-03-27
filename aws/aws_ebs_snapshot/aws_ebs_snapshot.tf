resource "aws_ebs_snapshot" "this" {
  volume_id              = var.volume_id
  description            = var.description
  outpost_arn            = var.outpost_arn
  storage_tier           = var.storage_tier
  permanent_restore      = var.permanent_restore
  temporary_restore_days = var.temporary_restore_days
  tags                   = var.tags
}

