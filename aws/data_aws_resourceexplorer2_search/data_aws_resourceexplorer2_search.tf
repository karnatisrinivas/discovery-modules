data "aws_resourceexplorer2_search" "this" {
  query_string = var.query_string
}
