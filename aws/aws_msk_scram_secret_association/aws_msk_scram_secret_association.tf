resource "aws_msk_scram_secret_association" "this" {
  cluster_arn     = var.cluster_arn
  secret_arn_list = var.secret_arn_list

}
