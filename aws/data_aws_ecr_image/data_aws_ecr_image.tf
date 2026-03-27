data "aws_ecr_image" "this" {
  repository_name = var.repository_name

  image_tag   = var.image_tag != "" ? var.image_tag : null
  most_recent = var.most_recent != false ? var.most_recent : null
}
