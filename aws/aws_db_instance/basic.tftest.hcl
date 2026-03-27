run "aws_db_instance" {
  command = plan

  variables {
    region                                = "us-west-2"
    identifier                            = "hello-world"
    engine                                = "mysql"
    ca_cert_identifier                    = "rds-ca-2019"
    snapshot_identifier                   = null
    customer_owned_ip_enabled             = null
    engine_version                        = "8.0.40"
    instance_class                        = "db.t3.micro"
    allocated_storage                     = 20
    db_name                               = "mydatabase"
    domain_ou                             = ""
    username                              = "admin"
    skip_final_snapshot                   = false
    db_subnet_group_name                  = null
    parameter_group_name                  = null
    vpc_security_group_ids                = []
    allow_major_version_upgrade           = null
    apply_immediately                     = null
    auto_minor_version_upgrade            = true
    availability_zone                     = null
    backup_retention_period               = 0
    backup_window                         = "05:57-06:27"
    blue_green_update                     = []
    character_set_name                    = ""
    copy_tags_to_snapshot                 = false
    custom_iam_instance_profile           = ""
    dedicated_log_volume                  = false
    delete_automated_backups              = true
    deletion_protection                   = false
    domain                                = ""
    domain_auth_secret_arn                = ""
    domain_dns_ips                        = ["10.0.0.1", "10.0.0.2"]
    domain_fqdn                           = ""
    domain_iam_role_name                  = ""
    enabled_cloudwatch_logs_exports       = []
    engine_lifecycle_support              = "open-source-rds-extended-support"
    final_snapshot_identifier             = "asd1234"
    iam_database_authentication_enabled   = false
    identifier_prefix                     = ""
    iops                                  = 0
    kms_key_id                            = ""
    license_model                         = "general-public-license"
    maintenance_window                    = "thu:09:45-thu:10:15"
    manage_master_user_password           = null
    master_user_secret_kms_key_id         = null
    max_allocated_storage                 = 0
    monitoring_interval                   = 0
    monitoring_role_arn                   = ""
    multi_az                              = false
    nchar_character_set_name              = ""
    network_type                          = "IPV4"
    option_group_name                     = "default:mysql-8-0"
    password                              = "hello-wrodl"
    performance_insights_enabled          = false
    performance_insights_kms_key_id       = ""
    performance_insights_retention_period = 0
    port                                  = 3306
    publicly_accessible                   = false
    replica_mode                          = ""
    replicate_source_db                   = null
    restore_to_point_in_time              = []
    s3_import                             = []
    storage_encrypted                     = false
    storage_throughput                    = 0
    storage_type                          = "gp2"
    timezone                              = ""
    upgrade_storage_config                = null
    tags = {
      Name = "example-db-instance"
    }
    timeouts = {
      create = "10m"
      delete = "10m"
      update = "10m"
    }
  }

  assert {
    condition     = aws_db_instance.this.db_name == "mydatabase"
    error_message = "DB instance identifier should be example-db-instance"
  }
}