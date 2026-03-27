variables {
  cluster_name    = "test-cluster"
  node_group_name = "test-node-group"
  node_role_arn   = "arn:aws:iam::123456789012:role/eks-node-role"
  subnet_ids      = ["subnet-12345678", "subnet-87654321"]
  scaling_config = [{
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }]
  update_config = [{
    max_unavailable            = 1
    max_unavailable_percentage = null
  }]
  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  disk_size            = 20
  force_update_version = false
  instance_types       = ["t3.medium"]
  labels = {
    "key1" = "value1"
    "key2" = "value2"
  }
  launch_template = [{
    id      = "lt-12345678"
    name    = null
    version = "$Latest"
  }]
  release_version = "1.18.9-20210708"
  remote_access   = null
  taint = [{
    effect = "NO_SCHEDULE"
    key    = "key1"
    value  = "value1"
  }]
  version = "1.18"

  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

}


run "validate" {
  command = plan
  assert {
    condition     = aws_eks_node_group.this.node_group_name == "test-node-group"
    error_message = "AWS EKS node group name is not correct"
  }

}
