data "aws_opensearchserverless_security_policy" "this" {
  name = var.name
  type = var.type
}
