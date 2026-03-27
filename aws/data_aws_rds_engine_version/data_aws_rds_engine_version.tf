data "aws_rds_engine_version" "this" {
  engine = var.engine

  default_only              = var.default_only
  has_major_target          = var.has_major_target
  has_minor_target          = var.has_minor_target
  include_all               = var.include_all
  latest                    = var.latest
  preferred_major_targets   = var.preferred_major_targets
  preferred_upgrade_targets = var.preferred_upgrade_targets
  preferred_versions        = var.preferred_versions
}
