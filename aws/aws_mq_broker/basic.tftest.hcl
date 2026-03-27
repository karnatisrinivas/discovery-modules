#tftest.hcl
variables {
  env                = "dev"
  region             = "us-east-1"
  broker_name        = "test-mq-broker"
  engine_type        = "ActiveMQ"
  engine_version     = "5.17.6"
  host_instance_type = "mq.t2.micro"
  user = [{
    username         = "testUser"
    password         = "ExampleTestPassword123!"
    console_access   = false
    groups           = null
    replication_user = false
  }]
  apply_immediately          = false
  authentication_strategy    = "simple"
  auto_minor_version_upgrade = false
  deployment_mode            = "SINGLE_INSTANCE"
  maintenance_window_start_time = [{
    day_of_week = "MONDAY"
    time_of_day = "02:00"
    time_zone   = "CET"
  }]
  publicly_accessible = false
  security_groups     = null
  subnet_ids          = null
  storage_type        = "efs"
  ldap_server_metadata = [{
    hosts                    = null
    role_base                = null
    role_name                = null
    role_search_matching     = null
    role_search_subtree      = null
    service_account_password = null
    service_account_username = null
    user_base                = null
    user_role_name           = null
    user_search_matching     = null
    user_search_subtree      = null
  }]
  logs = [{
    general = false
    audit   = false
  }]
  encryption_options = [{
    kms_key_id        = null
    use_aws_owned_key = true
  }]
  configuration = [{
    revision = 1
    id       = null
  }]

}

run "validate" {

  command = plan
  assert {
    condition     = aws_mq_broker.this.broker_name == "test-mq-broker"
    error_message = "MQ broker name is not correct"
  }

}