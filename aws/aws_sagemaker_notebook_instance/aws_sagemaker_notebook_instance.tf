resource "aws_sagemaker_notebook_instance" "this" {
  additional_code_repositories = var.additional_code_repositories
  default_code_repository      = var.default_code_repository
  direct_internet_access       = var.direct_internet_access
  instance_type                = var.instance_type
  kms_key_id                   = var.kms_key_id
  lifecycle_config_name        = var.lifecycle_config_name
  name                         = var.name
  platform_identifier          = var.platform_identifier
  role_arn                     = var.role_arn
  root_access                  = var.root_access
  security_groups              = var.security_groups
  subnet_id                    = var.subnet_id
  tags                         = var.tags
  volume_size                  = var.volume_size

  dynamic "instance_metadata_service_configuration" {
    for_each = var.instance_metadata_service_configuration
    content {
      minimum_instance_metadata_service_version = instance_metadata_service_configuration.value.minimum_instance_metadata_service_version
    }
  }

}
