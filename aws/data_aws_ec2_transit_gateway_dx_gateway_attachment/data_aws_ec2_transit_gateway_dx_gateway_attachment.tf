data "aws_ec2_transit_gateway_dx_gateway_attachment" "this" {

  dx_gateway_id      = var.dx_gateway_id
  transit_gateway_id = var.transit_gateway_id
}
