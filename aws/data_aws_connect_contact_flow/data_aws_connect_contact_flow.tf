data "aws_connect_contact_flow" "this" {
  instance_id     = var.instance_id
  contact_flow_id = var.contact_flow_id
  name            = var.name

  type = var.type
}
