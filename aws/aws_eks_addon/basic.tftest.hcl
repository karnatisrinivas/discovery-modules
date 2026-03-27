variables {
  cluster_name                = "developer-eks"
  addon_name                  = "coredns"
  addon_version               = "v1.10.1-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  service_account_role_arn    = ""
  region                      = "us-west-2"
  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }
  pod_identity_association = [
    {
      role_arn        = "arn:aws:iam::123456789012:role/AmazonEKS_CorednsRole"
      service_account = "coredns"
    }
  ]
  timeouts = {
    create = "30m"
    delete = "30m"
    update = "30m"
  }
  preserve                    = false
  resolve_conflicts_on_update = "OVERWRITE"
  configuration_values        = <<EOF
{
  "logLevel": "DEBUG",
  "replicas": 2
  }
EOF
}

run "test" {
  command = plan
  assert {
    condition     = aws_eks_addon.this.addon_name == "coredns"
    error_message = "The test for aws_eks_addon did not pass."
  }
}
