data "aws_sagemaker_prebuilt_ecr_image" "this" {
  repository_name = var.repository_name

  dns_suffix = var.dns_suffix
  image_tag  = var.image_tag
  region     = var.region
}
