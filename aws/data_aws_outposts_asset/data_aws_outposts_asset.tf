data "aws_outposts_asset" "this" {
  arn      = var.arn
  asset_id = var.asset_id
}
