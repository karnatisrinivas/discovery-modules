variables {
  region                 = "us-east-1"
  iam_instance_profile   = ""
  name                   = "hello"
  name_prefix            = ""
  placement_tenancy      = ""
  user_data              = "fdasfds"
  user_data_base64       = null
  spot_price             = ""
  enable_monitoring      = false
  image_id               = ""
  instance_type          = ""
  security_groups        = []
  ebs_block_device       = []
  ephemeral_block_device = []
  root_block_device      = []
  metadata_options       = []
}
run "test" {
  command = plan
  assert {
    condition     = aws_launch_configuration.this.user_data != null
    error_message = "aws_launch_configuration was not succesful"
  }
}
