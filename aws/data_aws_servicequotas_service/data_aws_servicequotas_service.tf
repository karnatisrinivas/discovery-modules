data "aws_servicequotas_service" "this" {
  service_name = var.service_name
}
