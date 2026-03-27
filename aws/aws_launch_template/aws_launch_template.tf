resource "aws_launch_template" "this" {
  name                                 = var.name == "" ? null : var.name
  description                          = var.description == "" ? null : var.description
  default_version                      = var.default_version != null ? var.default_version : null
  update_default_version               = var.default_version != null ? null : var.update_default_version
  image_id                             = var.image_id == "" ? null : var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior == "" ? null : var.instance_initiated_shutdown_behavior
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized == "" ? null : var.ebs_optimized
  instance_type                        = var.instance_type == "" ? null : var.instance_type
  kernel_id                            = var.kernel_id == "" ? null : var.kernel_id
  key_name                             = var.key_name == "" ? null : var.key_name
  ram_disk_id                          = var.ram_disk_id == "" ? null : var.ram_disk_id
  security_group_names                 = var.security_group_names == null ? null : (length(var.security_group_names) == 0 ? null : var.security_group_names)
  user_data                            = var.user_data == "" ? null : var.user_data
  vpc_security_group_ids               = var.vpc_security_group_ids == null ? null : (length(var.vpc_security_group_ids) == 0 ? null : var.vpc_security_group_ids)
  tags                                 = var.tags

  dynamic "block_device_mappings" {
    for_each = var.block_device_mappings
    content {
      device_name  = block_device_mappings.value.device_name != "" ? block_device_mappings.value.device_name : null
      no_device    = block_device_mappings.value.no_device != "" ? block_device_mappings.value.no_device : null
      virtual_name = block_device_mappings.value.virtual_name != "" ? block_device_mappings.value.virtual_name : null

      dynamic "ebs" {
        for_each = block_device_mappings.value.ebs
        content {
          delete_on_termination = ebs.value.delete_on_termination == "" ? null : tobool(ebs.value.delete_on_termination)
          encrypted             = ebs.value.encrypted == "" ? null : tobool(ebs.value.encrypted)
          iops                  = ebs.value.iops == 0 ? null : ebs.value.iops
          kms_key_id            = ebs.value.kms_key_id == "" ? null : ebs.value.kms_key_id
          snapshot_id           = ebs.value.snapshot_id == "" ? null : ebs.value.snapshot_id
          throughput            = ebs.value.throughput == 0 ? null : ebs.value.throughput
          volume_size           = ebs.value.volume_size == 0 ? null : ebs.value.volume_size
          volume_type           = ebs.value.volume_type == "" ? null : ebs.value.volume_type
        }
      }
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification
    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference
      dynamic "capacity_reservation_target" {
        for_each = capacity_reservation_specification.value.capacity_reservation_target != null ? capacity_reservation_specification.value.capacity_reservation_target : []
        content {
          capacity_reservation_id                 = capacity_reservation_target.value.capacity_reservation_id
          capacity_reservation_resource_group_arn = capacity_reservation_target.value.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = var.cpu_options
    content {
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  dynamic "credit_specification" {
    for_each = var.credit_specification
    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }

  dynamic "elastic_gpu_specifications" {
    for_each = var.elastic_gpu_specifications
    content {
      type = elastic_gpu_specifications.value.type
    }
  }

  dynamic "elastic_inference_accelerator" {
    for_each = var.elastic_inference_accelerator
    content {
      type = elastic_inference_accelerator.value.type
    }
  }

  dynamic "enclave_options" {
    for_each = var.enclave_options
    content {
      enabled = enclave_options.value.enabled
    }
  }

  dynamic "hibernation_options" {
    for_each = var.hibernation_options
    content {
      configured = hibernation_options.value.configured
    }
  }

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile
    content {
      arn  = iam_instance_profile.value.arn == "" ? null : iam_instance_profile.value.arn
      name = iam_instance_profile.value.name == "" ? null : iam_instance_profile.value.name
    }
  }

  dynamic "instance_market_options" {
    for_each = var.instance_market_options
    content {
      market_type = instance_market_options.value.market_type

      dynamic "spot_options" {
        for_each = instance_market_options.value.spot_options
        content {
          block_duration_minutes         = spot_options.value.block_duration_minutes
          instance_interruption_behavior = spot_options.value.instance_interruption_behavior == "" ? null : spot_options.value.instance_interruption_behavior
          max_price                      = spot_options.value.max_price == "" ? null : spot_options.value.max_price
          spot_instance_type             = spot_options.value.spot_instance_type == "" ? null : spot_options.value.spot_instance_type
          valid_until                    = spot_options.value.valid_until == "" ? null : spot_options.value.valid_until
        }
      }
    }
  }

  dynamic "license_specification" {
    for_each = var.license_specification
    content {
      license_configuration_arn = license_specification.value.license_configuration_arn
    }
  }

  dynamic "maintenance_options" {
    for_each = var.maintenance_options
    content {
      auto_recovery = maintenance_options.value.auto_recovery
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options
    content {
      http_endpoint               = metadata_options.value.http_endpoint == "" ? null : metadata_options.value.http_endpoint
      http_protocol_ipv6          = metadata_options.value.http_protocol_ipv6 == "" ? null : metadata_options.value.http_protocol_ipv6
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_tokens                 = metadata_options.value.http_tokens == "" ? null : metadata_options.value.http_tokens
      instance_metadata_tags      = metadata_options.value.instance_metadata_tags == "" ? null : metadata_options.value.instance_metadata_tags
    }
  }

  dynamic "monitoring" {
    for_each = var.monitoring
    content {
      enabled = monitoring.value.enabled
    }
  }

  dynamic "network_interfaces" {
    for_each = var.network_interfaces
    content {
      associate_carrier_ip_address = network_interfaces.value.associate_carrier_ip_address == "" ? null : tobool(network_interfaces.value.associate_carrier_ip_address)
      associate_public_ip_address  = network_interfaces.value.associate_public_ip_address == "" ? null : tobool(network_interfaces.value.associate_public_ip_address)
      delete_on_termination        = network_interfaces.value.delete_on_termination == "" ? null : tobool(network_interfaces.value.delete_on_termination)
      description                  = network_interfaces.value.description
      device_index                 = network_interfaces.value.device_index
      interface_type               = network_interfaces.value.interface_type == "" ? null : network_interfaces.value.interface_type
      ipv4_address_count           = network_interfaces.value.ipv4_address_count
      ipv4_addresses               = network_interfaces.value.ipv4_addresses
      ipv4_prefix_count            = network_interfaces.value.ipv4_prefix_count
      ipv4_prefixes                = network_interfaces.value.ipv4_prefixes
      ipv6_address_count           = network_interfaces.value.ipv6_address_count
      ipv6_addresses               = network_interfaces.value.ipv6_addresses
      ipv6_prefix_count            = network_interfaces.value.ipv6_prefix_count
      ipv6_prefixes                = network_interfaces.value.ipv6_prefixes
      network_card_index           = network_interfaces.value.network_card_index
      network_interface_id         = network_interfaces.value.network_interface_id
      private_ip_address           = network_interfaces.value.private_ip_address == "" ? null : network_interfaces.value.private_ip_address
      security_groups              = network_interfaces.value.security_groups
      subnet_id                    = network_interfaces.value.subnet_id
    }
  }

  dynamic "placement" {
    for_each = var.placement
    content {
      affinity                = placement.value.affinity
      availability_zone       = placement.value.availability_zone
      group_name              = placement.value.group_name
      host_id                 = placement.value.host_id
      host_resource_group_arn = placement.value.host_resource_group_arn
      partition_number        = placement.value.partition_number
      spread_domain           = placement.value.spread_domain
      tenancy                 = placement.value.tenancy
    }
  }

  dynamic "private_dns_name_options" {
    for_each = var.private_dns_name_options
    content {
      enable_resource_name_dns_aaaa_record = private_dns_name_options.value.enable_resource_name_dns_aaaa_record
      enable_resource_name_dns_a_record    = private_dns_name_options.value.enable_resource_name_dns_a_record
      hostname_type                        = private_dns_name_options.value.hostname_type
    }
  }

  dynamic "tag_specifications" {
    for_each = var.tag_specifications
    content {
      resource_type = tag_specifications.value.resource_type
      tags          = tag_specifications.value.tags
    }
  }
}
