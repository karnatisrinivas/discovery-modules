resource "aws_cognito_user_pool" "this" {
  name                       = var.name
  alias_attributes           = var.alias_attributes
  auto_verified_attributes   = var.auto_verified_attributes
  deletion_protection        = var.deletion_protection
  email_verification_message = var.email_verification_message
  email_verification_subject = var.email_verification_subject
  mfa_configuration          = var.mfa_configuration
  sms_authentication_message = var.sms_authentication_message
  sms_verification_message   = var.sms_verification_message
  username_attributes        = var.username_attributes
  tags                       = var.tags

  dynamic "account_recovery_setting" {
    for_each = var.account_recovery_setting
    content {
      recovery_mechanism {
        name     = account_recovery_setting.value.recovery_mechanism.name
        priority = account_recovery_setting.value.recovery_mechanism.priority
      }
    }
  }


  dynamic "admin_create_user_config" {
    for_each = var.admin_create_user_config
    content {
      allow_admin_create_user_only = admin_create_user_config.value.allow_admin_create_user_only

      invite_message_template {
        email_message = admin_create_user_config.value.invite_message_template.email_message
        email_subject = admin_create_user_config.value.invite_message_template.email_subject
        sms_message   = admin_create_user_config.value.invite_message_template.sms_message
      }
    }
  }


  dynamic "device_configuration" {
    for_each = var.device_configuration
    content {
      challenge_required_on_new_device      = device_configuration.value.challenge_required_on_new_device
      device_only_remembered_on_user_prompt = device_configuration.value.device_only_remembered_on_user_prompt
    }
  }

  dynamic "email_configuration" {
    for_each = var.email_configuration
    content {
      configuration_set      = email_configuration.value.configuration_set
      email_sending_account  = email_configuration.value.email_sending_account
      from_email_address     = email_configuration.value.from_email_address
      reply_to_email_address = email_configuration.value.reply_to_email_address
      source_arn             = email_configuration.value.source_arn
    }
  }

  dynamic "lambda_config" {
    for_each = var.lambda_config
    content {
      create_auth_challenge          = lambda_config.value.create_auth_challenge
      custom_message                 = lambda_config.value.custom_message
      define_auth_challenge          = lambda_config.value.define_auth_challenge
      post_authentication            = lambda_config.value.post_authentication
      post_confirmation              = lambda_config.value.post_confirmation
      pre_authentication             = lambda_config.value.pre_authentication
      pre_sign_up                    = lambda_config.value.pre_sign_up
      pre_token_generation           = lambda_config.value.pre_token_generation
      user_migration                 = lambda_config.value.user_migration
      verify_auth_challenge_response = lambda_config.value.verify_auth_challenge_response
      kms_key_id                     = lambda_config.value.kms_key_id

      pre_token_generation_config {
        lambda_arn     = lambda_config.value.pre_token_generation_config.lambda_arn
        lambda_version = lambda_config.value.pre_token_generation_config.lambda_version
      }

      custom_email_sender {
        lambda_arn     = lambda_config.value.custom_email_sender.lambda_arn
        lambda_version = "V1_0"
      }

      custom_sms_sender {
        lambda_arn     = lambda_config.value.custom_sms_sender.lambda_arn
        lambda_version = "V1_0"
      }
    }
  }

  dynamic "password_policy" {
    for_each = var.password_policy
    content {
      minimum_length                   = password_policy.value.minimum_length
      require_lowercase                = password_policy.value.require_lowercase
      require_numbers                  = password_policy.value.require_numbers
      require_symbols                  = password_policy.value.require_symbols
      require_uppercase                = password_policy.value.require_uppercase
      temporary_password_validity_days = password_policy.value.temporary_password_validity_days
    }
  }

  dynamic "schema" {
    for_each = var.schema
    content {
      attribute_data_type      = schema.value.attribute_data_type
      developer_only_attribute = schema.value.developer_only_attribute
      mutable                  = schema.value.mutable
      name                     = schema.value.name
      required                 = schema.value.required

      number_attribute_constraints {
        max_value = schema.value.number_attribute_constraints.max_value
        min_value = schema.value.number_attribute_constraints.min_value
      }

      string_attribute_constraints {
        max_length = schema.value.string_attribute_constraints.max_length
        min_length = schema.value.string_attribute_constraints.min_length
      }
    }
  }

  dynamic "sms_configuration" {
    for_each = var.sms_configuration
    content {
      external_id    = sms_configuration.value.external_id
      sns_caller_arn = sms_configuration.value.sns_caller_arn
      sns_region     = sms_configuration.value.sns_region
    }
  }

  dynamic "software_token_mfa_configuration" {
    for_each = var.software_token_mfa_configuration
    content {
      enabled = software_token_mfa_configuration.value.enabled
    }
  }

  dynamic "user_attribute_update_settings" {
    for_each = var.user_attribute_update_settings
    content {
      attributes_require_verification_before_update = user_attribute_update_settings.value.attributes_require_verification_before_update
    }
  }

  dynamic "user_pool_add_ons" {
    for_each = var.user_pool_add_ons
    content {
      advanced_security_mode = user_pool_add_ons.value.advanced_security_mode
    }
  }

  dynamic "username_configuration" {
    for_each = var.username_configuration
    content {
      case_sensitive = username_configuration.value.case_sensitive
    }
  }

  dynamic "verification_message_template" {
    for_each = var.verification_message_template
    content {
      default_email_option  = verification_message_template.value.default_email_option
      email_message         = verification_message_template.value.email_message
      email_message_by_link = verification_message_template.value.email_message_by_link
      email_subject         = verification_message_template.value.email_subject
      email_subject_by_link = verification_message_template.value.email_subject_by_link
      sms_message           = verification_message_template.value.sms_message
    }
  }
}




