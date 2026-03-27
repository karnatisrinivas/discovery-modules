variables {
  region     = "us-east-2"
  env        = "dev"
  repository = "test-ecr-repo"
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

run "validate" {

  command = plan
  assert {
    condition     = aws_ecr_lifecycle_policy.this.repository == "test-ecr-repo"
    error_message = "ECR lifecycle policy repository is not correct"
  }

}
