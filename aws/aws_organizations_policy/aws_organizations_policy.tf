resource "aws_organizations_policy" "this" {
  content      = var.content
  description  = var.description
  name         = var.name
  skip_destroy = var.skip_destroy
  tags         = var.tags
  type         = var.type

}
