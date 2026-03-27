variables {
  region                    = "us-east-1"
  override_policy_documents = []
  policy_id                 = "fdsafa"
  source_json               = ""
  source_policy_documents   = []
  override_json             = ""
  statement = [
    {
      actions        = []
      effect         = "Allow"
      not_actions    = []
      not_resources  = []
      resources      = []
      sid            = ""
      condition      = []
      not_principals = []
      principals     = []
    }
  ]
}
run "test" {
  command = plan
  assert {
    condition     = data.aws_iam_policy_document.this.policy_id != null
    error_message = "data.aws_iam_policy_document was not succesful"
  }
}
