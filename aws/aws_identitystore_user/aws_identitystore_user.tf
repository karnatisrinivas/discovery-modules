resource "aws_identitystore_user" "this" {
  display_name      = var.display_name
  identity_store_id = var.identity_store_id
  user_name         = var.user_name

  locale             = var.locale != null && var.locale != "" ? var.locale : null
  nickname           = var.nickname != null && var.nickname != "" ? var.nickname : null
  preferred_language = var.preferred_language != null && var.preferred_language != "" ? var.preferred_language : null
  profile_url        = var.profile_url != null && var.profile_url != "" ? var.profile_url : null
  timezone           = var.timezone != null && var.timezone != "" ? var.timezone : null
  title              = var.title != null && var.title != "" ? var.title : null
  user_type          = var.user_type != null && var.user_type != "" ? var.user_type : null

  dynamic "addresses" {
    for_each = var.addresses != null ? var.addresses : []
    content {
      country        = addresses.value.country != null && addresses.value.country != "" ? addresses.value.country : null
      formatted      = addresses.value.formatted != null && addresses.value.formatted != "" ? addresses.value.formatted : null
      locality       = addresses.value.locality != null && addresses.value.locality != "" ? addresses.value.locality : null
      postal_code    = addresses.value.postal_code != null && addresses.value.postal_code != "" ? addresses.value.postal_code : null
      primary        = addresses.value.primary
      region         = addresses.value.region != null && addresses.value.region != "" ? addresses.value.region : null
      street_address = addresses.value.street_address != null && addresses.value.street_address != "" ? addresses.value.street_address : null
      type           = addresses.value.type != null && addresses.value.type != "" ? addresses.value.type : null
    }
  }

  dynamic "emails" {
    for_each = var.emails != null ? var.emails : []
    content {
      primary = emails.value.primary
      type    = emails.value.type != null && emails.value.type != "" ? emails.value.type : null
      value   = emails.value.value != null && emails.value.value != "" ? emails.value.value : null
    }
  }

  dynamic "name" {
    for_each = var.name != null ? var.name : []
    content {
      family_name = name.value.family_name
      given_name  = name.value.given_name

      formatted        = name.value.formatted != null && name.value.formatted != "" ? name.value.formatted : null
      honorific_prefix = name.value.honorific_prefix != null && name.value.honorific_prefix != "" ? name.value.honorific_prefix : null
      honorific_suffix = name.value.honorific_suffix != null && name.value.honorific_suffix != "" ? name.value.honorific_suffix : null
      middle_name      = name.value.middle_name != null && name.value.middle_name != "" ? name.value.middle_name : null
    }
  }

  dynamic "phone_numbers" {
    for_each = var.phone_numbers != null ? var.phone_numbers : []
    content {
      primary = phone_numbers.value.primary
      type    = phone_numbers.value.type != null && phone_numbers.value.type != "" ? phone_numbers.value.type : null
      value   = phone_numbers.value.value != null && phone_numbers.value.value != "" ? phone_numbers.value.value : null
    }
  }
}