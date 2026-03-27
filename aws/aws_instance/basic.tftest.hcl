variables {
  ami                                  = "ami"
  associate_public_ip_address          = true
  enable_primary_ipv6                  = true
  availability_zone                    = "us-west-2"
  disable_api_stop                     = true
  disable_api_termination              = true
  ebs_optimized                        = true
  get_password_data                    = true
  hibernation                          = true
  host_id                              = "host_id"
  host_resource_group_arn              = null
  iam_instance_profile                 = "iam profile"
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "instance_type"
  ipv6_address_count                   = 2
  ipv6_addresses                       = null
  key_name                             = "key_pair_name"
  monitoring                           = true
  placement_group                      = "palcement_group_id"
  placement_partition_number           = null
  private_ip                           = "0.0.0.0"
  secondary_private_ips                = ["1.1.1.1"]
  security_groups                      = ["sg_id_1"]
  source_dest_check                    = false
  subnet_id                            = "subnet_id"
  tags                                 = {}
  tenancy                              = "default"
  user_data                            = "this is user data"
  user_data_base64                     = null
  user_data_replace_on_change          = true
  volume_tags                          = null
  vpc_security_group_ids               = []

  capacity_reservation_specification = [
    {
      capacity_reservation_preference = "none"
      capacity_reservation_target     = []
    }
  ]

  cpu_options = [
    {
      amd_sev_snp      = "enabled"
      core_count       = 1
      threads_per_core = 1
    }
  ]

  credit_specification = [
    {
      cpu_credits = "unlimited"
    }
  ]

  ebs_block_device = [
    {
      delete_on_termination = false
      device_name           = "example"
      encrypted             = true
      iops                  = 1
      kms_key_id            = "kms_id"
      snapshot_id           = null
      tags                  = {}
      throughput            = 2
      volume_size           = 2
      volume_type           = "gp3"
    }
  ]

  enclave_options = [
    {
      enabled = true
    }
  ]

  ephemeral_block_device = [
    {
      device_name  = "device name"
      no_device    = null
      virtual_name = "ephemeral0"
    }
  ]

  instance_market_options = [
    {
      market_type = "spot"
      spot_options = [{
        instance_interruption_behavior = "terminate"
        max_price                      = 100
        spot_instance_type             = "persistent"
        valid_until                    = "2024-06-18T14:45:55Z"
      }]
    }
  ]

  launch_template = [
    {
      id      = "lt-1"
      name    = null
      version = "$Latest"
    }
  ]

  maintenance_options = [
    {
      auto_recovery = "default"
    }
  ]

  metadata_options = [
    {
      http_endpoint               = "enabled"
      http_protocol_ipv6          = "enabled"
      http_put_response_hop_limit = 64
      http_tokens                 = "required"
      instance_metadata_tags      = "enabled"
    }
  ]

  network_interface = []

  private_dns_name_options = [
    {
      enable_resource_name_dns_aaaa_record = true
      enable_resource_name_dns_a_record    = true
      hostname_type                        = "resource-name"
    }
  ]

  root_block_device = [
    {
      delete_on_termination = false
      encrypted             = true
      iops                  = 1
      kms_key_id            = "kms_key_id"
      tags                  = {}
      throughput            = 1
      volume_size           = 1
      volume_type           = "gp3"
    }
  ]
  timeouts = {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
  region = "us-west-2"
}

run "test" {
  command = plan
  assert {
    condition     = aws_instance.this.ami == "ami"
    error_message = "The test for aws_instance did not pass."
  }
}