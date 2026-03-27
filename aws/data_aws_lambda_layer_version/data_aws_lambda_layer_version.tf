data "aws_lambda_layer_version" "this" {
  layer_name = var.layer_name

  compatible_architecture = var.compatible_architecture
  compatible_runtime      = var.compatible_runtime
}
