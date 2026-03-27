variables {
  region                     = "us-west-2"
  name                       = "mypoolexampletest"
  alias_attributes           = ["email"]
  auto_verified_attributes   = ["email"]
  deletion_protection        = "ACTIVE"
  email_verification_message = null
  email_verification_subject = null
  mfa_configuration          = "ON"
  sms_authentication_message = "sms auth msg {####}"
  username_attributes        = null
  sms_verification_message   = null

  account_recovery_setting = [
    {
      recovery_mechanism = {
        name     = "verified_email"
        priority = 1
      }
    }
  ]

  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

  admin_create_user_config = [
    {
      allow_admin_create_user_only = false
      invite_message_template = {
        email_message = "email message {username} blah blah {####}"
        email_subject = "This is a subject line"
        sms_message   = "sms message {username} blah blah {####}"
      }

    }
  ]

  device_configuration = [
    {
      challenge_required_on_new_device      = true
      device_only_remembered_on_user_prompt = true
    }
  ]

  email_configuration = [
    {
      configuration_set      = "configuration set"
      email_sending_account  = "DEVELOPER"
      from_email_address     = "myemail@example.com"
      reply_to_email_address = "replyto@example.com"
      source_arn             = "arn:aws:ses:us-west-2:123456789012:identity/example@example.com"
    }
  ]

  lambda_config = []

  password_policy = [
    {
      minimum_length                   = 8
      require_lowercase                = true
      require_numbers                  = true
      require_symbols                  = true
      require_uppercase                = true
      temporary_password_validity_days = 7
    }
  ]

  schema = [
    {
      attribute_data_type      = "Number"
      developer_only_attribute = false
      mutable                  = true
      name                     = "myschema"
      required                 = true
      string_attribute_constraints = {
        max_length = null
        min_length = null
      }
      number_attribute_constraints = {
        max_value = 500
        min_value = 0
      }

    }
  ]

  sms_configuration = [
    {
      external_id    = "asdasdasdasdasdasd"
      sns_caller_arn = "arn:aws:iam::123456789012:user/ExampleUser"
      sns_region     = "us-east-1"
    }
  ]

  software_token_mfa_configuration = [
    {
      enabled = true
    }
  ]

  user_attribute_update_settings = [
    {
      attributes_require_verification_before_update = ["email"]
    }
  ]

  user_pool_add_ons = [
    {
      advanced_security_mode = "OFF"
    }
  ]

  username_configuration = [
    {
      case_sensitive = true
    }
  ]

  verification_message_template = [
    {
      default_email_option = "CONFIRM_WITH_CODE"
      email_message        = "This is an email {####}"
      email_subject        = "This is a subject"

      email_message_by_link = null
      email_subject_by_link = null
      sms_message           = null
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_cognito_user_pool.this.name == "mypoolexampletest"
    error_message = "The test for AWS Cognito User Pool did not pass"
  }
}