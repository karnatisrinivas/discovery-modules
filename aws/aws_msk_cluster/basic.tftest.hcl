variables {
  region                 = "us-west-2"
  cluster_name           = "test-msk-cluster"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = "2"
  storage_mode           = "LOCAL"
  broker_node_group_info = [
    {
      instance_type     = "kafka.m5.large"
      client_subnets    = ["subnet-0227e2b0abc5f975e", "subnet-026a7c8d08743d2f8"]
      security_groups   = ["sg-0f5781b48c03f6f2a"]
      connectivity_info = []
      storage_info      = []
    }
  ]
  vpc_id = "vpc-0c37ffe0affae162f"
  tags = {
    Name = "test-msk-cluster"
  }
  client_authentication = []
  configuration_info    = []
  encryption_info       = []
  enhanced_monitoring   = "PER_BROKER"
  logging_info          = []
  open_monitoring       = []
  timeouts = {
    create = "10m"
    delete = "10m"
  }
}

run "validate" {
  command = plan
  assert {
    condition     = aws_msk_cluster.this.cluster_name == "test-msk-cluster"
    error_message = "cluster name is not correct"
  }
}