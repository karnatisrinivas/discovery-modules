data "aws_msk_kafka_version" "this" {

  preferred_versions = var.preferred_versions
}
