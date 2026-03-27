data "aws_eks_addon" "this" {
  addon_name   = var.addon_name
  cluster_name = var.cluster_name
}
