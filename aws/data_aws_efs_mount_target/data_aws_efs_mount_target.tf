data "aws_efs_mount_target" "this" {

  access_point_id = var.access_point_id
}
