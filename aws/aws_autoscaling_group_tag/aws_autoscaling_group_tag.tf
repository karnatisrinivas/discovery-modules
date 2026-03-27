resource "aws_autoscaling_group_tag" "this" {
  autoscaling_group_name = var.autoscaling_group_name

  dynamic "tag" {
    for_each = var.tag
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    }
  }

}
