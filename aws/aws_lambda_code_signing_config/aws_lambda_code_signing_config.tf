resource "aws_lambda_code_signing_config" "this" {
  description = var.description
  tags        = var.tags

  dynamic "allowed_publishers" {
    for_each = var.allowed_publishers
    content {
      signing_profile_version_arns = allowed_publishers.value.signing_profile_version_arns
    }
  }

  dynamic "policies" {
    for_each = var.policies
    content {
      untrusted_artifact_on_deployment = policies.value.untrusted_artifact_on_deployment
    }
  }

}
