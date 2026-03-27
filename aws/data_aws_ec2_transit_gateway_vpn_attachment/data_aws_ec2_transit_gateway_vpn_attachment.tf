data "aws_ec2_transit_gateway_vpn_attachment" "this" {

  transit_gateway_id = var.transit_gateway_id
  vpn_connection_id  = var.vpn_connection_id
}
