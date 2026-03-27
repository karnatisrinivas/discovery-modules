resource "aws_keyspaces_keyspace" "this" {
  name = var.name
  tags = var.tags
}



