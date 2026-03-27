data "aws_opensearchserverless_lifecycle_policy" "this" {
  name = var.name
  type = var.type
}
