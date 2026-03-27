resource "aws_sagemaker_code_repository" "this" {
  code_repository_name = var.code_repository_name
  tags                 = var.tags

  dynamic "git_config" {
    for_each = var.git_config
    content {
      branch         = git_config.value.branch
      repository_url = git_config.value.repository_url
      secret_arn     = git_config.value.secret_arn
    }
  }

}
