data "aws_appstream_image" "this" {

  most_recent = var.most_recent
  name_regex  = var.name_regex
  type        = var.type
}
