variables {
  region                    = "us-west-2"
  name                      = "test-kinesis-stream"
  shard_count               = "1"
  retention_period          = 24
  shard_level_metrics       = null
  enforce_consumer_deletion = true
  encryption_type           = null
  stream_mode_details = [{
    stream_mode = "PROVISIONED"
  }]
  kms_key_id = null
  tags = {
    Environment = "dev"
    Name        = "test-kinesis-stream"
  }
  timeouts = {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}

run "validate" {

  command = apply
  assert {
    condition     = aws_kinesis_stream.this.name == "test-kinesis-stream"
    error_message = "Kinesis stream name is not correct"
  }

}
