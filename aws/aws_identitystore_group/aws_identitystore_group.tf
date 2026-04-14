resource "aws_identitystore_group" "this" {
  description       = var.description != null && var.description != "" ? var.description : null
  display_name      = var.display_name
  identity_store_id = var.identity_store_id
}
