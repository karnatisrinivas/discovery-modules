data "aws_connect_vocabulary" "this" {
  instance_id   = var.instance_id
  vocabulary_id = var.vocabulary_id
  name          = var.name
}
