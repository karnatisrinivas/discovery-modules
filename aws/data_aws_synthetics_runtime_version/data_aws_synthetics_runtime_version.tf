data "aws_synthetics_runtime_version" "this" {
  prefix = var.prefix

  latest = var.latest
}
