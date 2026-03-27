variables {
  region               = "us-east-2"
  env                  = "dev"
  name                 = "test-ecr-repo"
  force_delete         = false
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration = [{
    scan_on_push : true
  }]
  encryption_configuration = null
  tags                     = null
}

run "validate" {

  command = plan
  assert {
    condition     = aws_ecr_repository.this.name == "test-ecr-repo"
    error_message = "ECR repository  name is not correct"
  }

}
