data "aws_kendra_experience" "this" {
  experience_id = var.experience_id
  index_id      = var.index_id
}
