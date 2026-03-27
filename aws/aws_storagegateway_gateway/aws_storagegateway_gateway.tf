resource "aws_storagegateway_gateway" "this" {
  activation_key                              = var.activation_key
  average_download_rate_limit_in_bits_per_sec = var.average_download_rate_limit_in_bits_per_sec
  average_upload_rate_limit_in_bits_per_sec   = var.average_upload_rate_limit_in_bits_per_sec
  cloudwatch_log_group_arn                    = var.cloudwatch_log_group_arn
  gateway_ip_address                          = var.gateway_ip_address
  gateway_name                                = var.gateway_name
  gateway_timezone                            = var.gateway_timezone
  gateway_type                                = var.gateway_type
  gateway_vpc_endpoint                        = var.gateway_vpc_endpoint
  medium_changer_type                         = var.medium_changer_type
  smb_file_share_visibility                   = var.smb_file_share_visibility
  smb_guest_password                          = var.smb_guest_password
  smb_security_strategy                       = var.smb_security_strategy
  tags                                        = var.tags
  tape_drive_type                             = var.tape_drive_type

  dynamic "maintenance_start_time" {
    for_each = var.maintenance_start_time
    content {
      day_of_month   = maintenance_start_time.value.day_of_month
      day_of_week    = maintenance_start_time.value.day_of_week
      hour_of_day    = maintenance_start_time.value.hour_of_day
      minute_of_hour = maintenance_start_time.value.minute_of_hour
    }
  }

  dynamic "smb_active_directory_settings" {
    for_each = var.smb_active_directory_settings
    content {
      domain_controllers  = smb_active_directory_settings.value.domain_controllers
      domain_name         = smb_active_directory_settings.value.domain_name
      organizational_unit = smb_active_directory_settings.value.organizational_unit
      password            = smb_active_directory_settings.value.password
      timeout_in_seconds  = smb_active_directory_settings.value.timeout_in_seconds
      username            = smb_active_directory_settings.value.username
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
    }
  }

}
