resource "aws_elb" "this" {
  name        = var.name
  name_prefix = var.name != null ? null : var.name_prefix

  dynamic "access_logs" {
    for_each = var.access_logs
    content {
      bucket        = access_logs.value.bucket
      bucket_prefix = access_logs.value.bucket_prefix
      enabled       = access_logs.value.enabled
      interval      = access_logs.value.interval
    }
  }

  availability_zones = var.availability_zones
  security_groups    = var.security_groups
  subnets            = var.subnets
  instances          = var.instances
  internal           = var.internal

  dynamic "listener" {
    for_each = var.listener
    content {
      instance_port      = listener.value.instance_port
      instance_protocol  = listener.value.instance_protocol
      lb_port            = listener.value.lb_port
      lb_protocol        = listener.value.lb_protocol
      ssl_certificate_id = listener.value.lb_protocol == "https" || listener.value.lb_protocol == "ssl" ? listener.value.ssl_certificate_id : null
    }
  }

  dynamic "health_check" {
    for_each = var.health_check
    content {
      target              = health_check.value.target
      interval            = health_check.value.interval
      timeout             = health_check.value.timeout
      healthy_threshold   = health_check.value.healthy_threshold
      unhealthy_threshold = health_check.value.unhealthy_threshold
    }
  }

  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  desync_mitigation_mode      = var.desync_mitigation_mode
  tags                        = var.tags
} 