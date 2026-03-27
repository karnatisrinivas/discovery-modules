data "aws_connect_queue" "this" {
  instance_id = var.instance_id
  name        = var.name
  queue_id    = var.queue_id
}
