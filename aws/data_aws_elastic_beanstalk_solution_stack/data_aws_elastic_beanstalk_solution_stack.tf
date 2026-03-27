data "aws_elastic_beanstalk_solution_stack" "this" {
  name_regex = var.name_regex

  most_recent = var.most_recent
}
