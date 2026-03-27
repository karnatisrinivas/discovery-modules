resource "aws_msk_serverless_cluster" "this" {
  cluster_name = var.cluster_name
  tags         = var.tags

  dynamic "client_authentication" {
    for_each = var.client_authentication
    content {
      dynamic "sasl" {
        for_each = client_authentication.value.sasl
        content {
          dynamic "iam" {
            for_each = sasl.value.iam
            content {
              enabled = iam.value.enabled
            }
          }

        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

}
