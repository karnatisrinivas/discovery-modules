resource "aws_eks_access_policy_association" "this" {
  cluster_name  = var.cluster_name
  policy_arn    = var.policy_arn
  principal_arn = var.principal_arn

  dynamic "access_scope" {
    for_each = var.access_scope
    content {
      namespaces = access_scope.value.namespaces
      type       = access_scope.value.type
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
