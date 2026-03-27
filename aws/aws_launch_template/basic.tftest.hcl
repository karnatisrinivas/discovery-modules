variables {
  # Required variables with realistic values
  name                                 = "test-launch-template"
  description                          = "Test Launch Template for EC2 instances"
  image_id                             = "ami-0d6621c01e8c2de2c" # Amazon Linux 2 AMI in us-west-2
  instance_type                        = "t3.micro"
  instance_initiated_shutdown_behavior = "terminate"
  default_version                      = 1
  disable_api_termination              = false
  ebs_optimized                        = "true"

  security_group_names               = []
  vpc_security_group_ids             = null
  key_name                           = null
  kernel_id                          = null
  ram_disk_id                        = null
  user_data                          = null
  capacity_reservation_specification = []
  cpu_options                        = []
  credit_specification               = []
  elastic_gpu_specifications         = []
  elastic_inference_accelerator      = []
  enclave_options                    = []
  hibernation_options                = []
  iam_instance_profile               = []
  instance_market_options            = []
  license_specification              = []
  maintenance_options                = []
  metadata_options = [
    {
      http_endpoint               = "enabled"
      http_protocol_ipv6          = "disabled"
      http_put_response_hop_limit = 1
      http_tokens                 = "required"
      instance_metadata_tags      = "enabled"
    }
  ]
  monitoring               = [{ enabled = true }]
  placement                = []
  private_dns_name_options = []
  # Block Device Mappings
  block_device_mappings = [
    {
      device_name  = "/dev/xvda"
      no_device    = null
      virtual_name = null
      ebs = [
        {
          delete_on_termination = true
          encrypted             = true
          iops                  = 3000
          kms_key_id            = null # Optional: Requires existing KMS key
          snapshot_id           = null # Optional: Requires existing snapshot
          throughput            = 125
          volume_size           = 30
          volume_type           = "gp3"
        }
      ]
    }
  ]

  # Network Interfaces - Optional: Most values require existing VPC resources
  network_interfaces = [
    {
      associate_carrier_ip_address = false
      associate_public_ip_address  = true
      delete_on_termination        = true
      description                  = "Primary network interface"
      device_index                 = 0
      interface_type               = "interface"
      ipv4_address_count           = 0
      ipv4_addresses               = []
      ipv4_prefix_count            = 0
      ipv4_prefixes                = []
      ipv6_address_count           = 0
      ipv6_addresses               = []
      ipv6_prefix_count            = 0
      ipv6_prefixes                = []
      network_card_index           = 0
      network_interface_id         = null # Optional: Requires existing ENI
      private_ip_address           = null
      security_groups              = []   # Optional: Requires existing security groups
      subnet_id                    = null # Optional: Requires existing subnet
    }
  ]

  # Tags
  tags = {
    Environment = "test"
    Project     = "launch-template-test"
  }

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        Name        = "test-instance"
        Environment = "test"
      }
    },
    {
      resource_type = "volume"
      tags = {
        Name        = "test-volume"
        Environment = "test"
      }
    }
  ]
}

run "verify_launch_template_creation" {
  command = apply

  assert {
    condition     = aws_launch_template.this.name == var.name
    error_message = "Launch template name does not match input"
  }

  assert {
    condition     = aws_launch_template.this.description == var.description
    error_message = "Launch template description does not match input"
  }

  assert {
    condition     = aws_launch_template.this.instance_type == var.instance_type
    error_message = "Launch template instance type does not match input"
  }

  assert {
    condition     = length(aws_launch_template.this.block_device_mappings) == 1
    error_message = "Launch template should have exactly one block device mapping"
  }

  assert {
    condition     = aws_launch_template.this.block_device_mappings[0].ebs[0].volume_type == "gp3"
    error_message = "Launch template block device should be gp3"
  }

  assert {
    condition     = aws_launch_template.this.metadata_options[0].http_tokens == "required"
    error_message = "Launch template should have IMDSv2 required"
  }

  assert {
    condition     = aws_launch_template.this.monitoring[0].enabled == true
    error_message = "Launch template should have monitoring enabled"
  }
} 