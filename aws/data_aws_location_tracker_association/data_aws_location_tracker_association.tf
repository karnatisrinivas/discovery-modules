data "aws_location_tracker_association" "this" {
  consumer_arn = var.consumer_arn
  tracker_name = var.tracker_name
}
