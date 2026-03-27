data "aws_fsx_openzfs_snapshot" "this" {

  most_recent  = var.most_recent
  name         = var.name
  snapshot_ids = var.snapshot_ids
}
