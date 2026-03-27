variables {
  listener_arn = "arn:aws:elasticloadbalancing:us-west-2:123456789012:listener/app/my-load-balancer/50dc6c495c0c9188/1a2b3c4d5e6f7g8h"
  priority     = 500
  action = [{
    type = "forward"
    forward = [{
      target_group = [
        {
          arn    = "arn:aws:elasticloadbalancing:us-west-2:123456789012:listener/app/my-load-balancer/50dc6c495c0c9188/1a2b3c4d5e6f7g8h"
          weight = 400
        }
      ]
      stickiness = [{
        enabled  = true
        duration = 50000
      }]
    }]
    authenticate_cognito = []
    authenticate_oidc    = []
    fixed_response       = []
    order                = 1000
    redirect             = []
    target_group_arn     = null
  }]
  condition = [{
    host_header = [{
      values = ["pattern"]
    }]
    http_header         = []
    http_request_method = []
    path_pattern        = []
    query_string        = []
    source_ip = [{
      values = []
    }]
  }]
  tags = {}
}

run "test" {
  command = plan
  assert {
    condition     = aws_lb_listener_rule.this.listener_arn == "arn:aws:elasticloadbalancing:us-west-2:123456789012:listener/app/my-load-balancer/50dc6c495c0c9188/1a2b3c4d5e6f7g8h"
    error_message = "Did not pass test for AWS LB Listener Rule"
  }
}