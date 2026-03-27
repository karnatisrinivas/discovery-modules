resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  dynamic "scaling_config" {
    for_each = var.scaling_config
    content {
      desired_size = scaling_config.value.desired_size
      max_size     = scaling_config.value.max_size
      min_size     = scaling_config.value.min_size
    }
  }

  dynamic "update_config" {
    for_each = var.update_config
    content {
      max_unavailable            = update_config.value.max_unavailable == 0 ? null : update_config.value.max_unavailable
      max_unavailable_percentage = update_config.value.max_unavailable_percentage == 0 ? null : update_config.value.max_unavailable_percentage
    }
  }

  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size
  force_update_version = var.force_update_version
  instance_types       = var.instance_types
  labels               = var.labels

  dynamic "launch_template" {
    for_each = var.launch_template
    content {
      id      = launch_template.value.id == "" ? null : launch_template.value.id
      name    = (launch_template.value.id == "" || launch_template.value.id == null) ? launch_template.value.name : null
      version = launch_template.value.version
    }
  }

  release_version = var.release_version
  dynamic "remote_access" {
    for_each = var.remote_access != null ? var.remote_access : []
    content {
      ec2_ssh_key               = remote_access.value.ec2_ssh_key
      source_security_group_ids = remote_access.value.source_security_group_ids
    }
  }
  dynamic "taint" {
    for_each = var.taint
    content {
      effect = taint.value.effect
      key    = taint.value.key
      value  = taint.value.value
    }
  }
  tags = var.tags
}
