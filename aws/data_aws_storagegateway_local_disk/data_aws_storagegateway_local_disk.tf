data "aws_storagegateway_local_disk" "this" {
  gateway_arn = var.gateway_arn
}
