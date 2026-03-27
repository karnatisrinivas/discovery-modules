data "aws_emr_supported_instance_types" "this" {
  release_label = var.release_label
}
