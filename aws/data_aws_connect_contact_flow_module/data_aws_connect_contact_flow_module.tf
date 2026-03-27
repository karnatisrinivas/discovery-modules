data "aws_connect_contact_flow_module" "this" {
  instance_id            = var.instance_id
  contact_flow_module_id = var.contact_flow_module_id
  name                   = var.name
}
