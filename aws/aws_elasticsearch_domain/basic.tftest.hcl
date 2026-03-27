variables {
  region                    = "us-east-1"
  domain_name               = "sometandom"
  elasticsearch_version     = "7.10"
  tags                      = {}
  cluster_config            = []
  cognito_options           = []
  domain_endpoint_options   = []
  ebs_options               = []
  encrypt_at_rest           = []
  endpoint_options          = []
  node_to_node_encryption   = []
  snapshot_options          = []
  vpc_options               = []
  timeouts                  = {}
  auto_tune_options         = []
  access_policies           = ""
  advanced_options          = {}
  advanced_security_options = []
  log_publishing_options    = []


}
run "test" {
  command = plan
  assert {
    condition     = aws_elasticsearch_domain.this.domain_name != null
    error_message = "aws_elasticsearch_domain was not succesful"
  }
}
