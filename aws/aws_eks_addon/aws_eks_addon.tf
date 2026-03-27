resource "aws_eks_addon" "this" {
  addon_name                  = var.addon_name
  addon_version               = var.addon_version
  cluster_name                = var.cluster_name
  configuration_values        = var.configuration_values
  preserve                    = var.preserve
  resolve_conflicts_on_create = var.resolve_conflicts_on_create
  resolve_conflicts_on_update = var.resolve_conflicts_on_update
  service_account_role_arn    = var.service_account_role_arn
  tags                        = var.tags

  dynamic "pod_identity_association" {
    for_each = var.pod_identity_association
    content {
      role_arn        = pod_identity_association.value.role_arn
      service_account = pod_identity_association.value.service_account
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
