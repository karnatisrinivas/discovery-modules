variables {
  name                    = "my-eks"
  role_arn                = "arn:aws:service:us-east-2:012345678911:resource-id"
  endpoint_private_access = false
  endpoint_public_access  = true
  public_access_cidrs     = ["0.0.0.0/0"]
  subnet_ids              = ["subnet-123456789"]
  security_group_ids      = []
  access_config           = []
  encryption_config       = []
  kubernetes_network_config = [
    {
      elastic_load_balancing = [
        {
          enabled = true
        }
      ]
      ip_family         = "ipv4"
      service_ipv4_cidr = "10.100.0.0/16"
    }
  ]
  outpost_config = []
  tags           = {}
  eks_version    = null
  region         = "us-east-1"
  vpc_config = [
    {
      endpoint_private_access = false
      endpoint_public_access  = true
      public_access_cidrs     = null
      subnet_ids              = ["subnet-123456789"]
      security_group_ids      = []
    }
  ]
  enabled_cluster_log_types     = []
  bootstrap_self_managed_addons = false
  compute_config = [
    {
      enabled       = true
      node_pools    = []
      node_role_arn = "arn:aws:iam::012345678911:role/my-eks-node-role"
    }
  ]
  storage_config = [
    {
      block_storage = [
        {
          enabled = true
        }
      ]
    }
  ]
  timeouts = {
    create = "10m"
    delete = "10m"
    update = "10m"
  }
  remote_network_config = [
    {
      remote_node_networks = [
        { cidrs = ["10.0.0.0/8"] }
      ]
    }
  ]
  upgrade_policy = [
    {
      support_type = "STANDARD"
    }
  ]
  zonal_shift_config = []
}

run "test" {
  command = plan
  assert {
    condition     = aws_eks_cluster.this.name == "my-eks"
    error_message = "The test for aws_eks did not pass."
  }
}
