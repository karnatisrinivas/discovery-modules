data "aws_batch_job_definition" "this" {

  arn      = var.arn
  name     = var.name
  revision = var.revision
  status   = var.status
}
