resource "google_dns_record_set" "this" {
  managed_zone = var.managed_zone
  name         = var.name
  rrdatas      = var.rrdatas
  ttl          = var.ttl
  type         = var.type

  dynamic "routing_policy" {
    for_each = var.routing_policy
    content {
      enable_geo_fencing = routing_policy.value.enable_geo_fencing
      health_check       = routing_policy.value.health_check

      dynamic "geo" {
        for_each = routing_policy.value.geo
        content {
          location = geo.value.location
          rrdatas  = geo.value.rrdatas

          dynamic "health_checked_targets" {
            for_each = geo.value.health_checked_targets
            content {
              external_endpoints = health_checked_targets.value.external_endpoints

              dynamic "internal_load_balancers" {
                for_each = health_checked_targets.value.internal_load_balancers
                content {
                  ip_address         = internal_load_balancers.value.ip_address
                  ip_protocol        = internal_load_balancers.value.ip_protocol
                  load_balancer_type = internal_load_balancers.value.load_balancer_type
                  network_url        = internal_load_balancers.value.network_url
                  port               = internal_load_balancers.value.port
                  project            = internal_load_balancers.value.project
                  region             = internal_load_balancers.value.region
                }
              }

            }
          }

        }
      }

      dynamic "primary_backup" {
        for_each = routing_policy.value.primary_backup
        content {
          enable_geo_fencing_for_backups = primary_backup.value.enable_geo_fencing_for_backups
          trickle_ratio                  = primary_backup.value.trickle_ratio

          dynamic "backup_geo" {
            for_each = primary_backup.value.backup_geo
            content {
              location = backup_geo.value.location
              rrdatas  = backup_geo.value.rrdatas

              dynamic "health_checked_targets" {
                for_each = backup_geo.value.health_checked_targets
                content {
                  external_endpoints = health_checked_targets.value.external_endpoints

                  dynamic "internal_load_balancers" {
                    for_each = health_checked_targets.value.internal_load_balancers
                    content {
                      ip_address         = internal_load_balancers.value.ip_address
                      ip_protocol        = internal_load_balancers.value.ip_protocol
                      load_balancer_type = internal_load_balancers.value.load_balancer_type
                      network_url        = internal_load_balancers.value.network_url
                      port               = internal_load_balancers.value.port
                      project            = internal_load_balancers.value.project
                      region             = internal_load_balancers.value.region
                    }
                  }

                }
              }

            }
          }

          dynamic "primary" {
            for_each = primary_backup.value.primary
            content {
              external_endpoints = primary.value.external_endpoints

              dynamic "internal_load_balancers" {
                for_each = primary.value.internal_load_balancers
                content {
                  ip_address         = internal_load_balancers.value.ip_address
                  ip_protocol        = internal_load_balancers.value.ip_protocol
                  load_balancer_type = internal_load_balancers.value.load_balancer_type
                  network_url        = internal_load_balancers.value.network_url
                  port               = internal_load_balancers.value.port
                  project            = internal_load_balancers.value.project
                  region             = internal_load_balancers.value.region
                }
              }

            }
          }

        }
      }

      dynamic "wrr" {
        for_each = routing_policy.value.wrr
        content {
          rrdatas = wrr.value.rrdatas
          weight  = wrr.value.weight

          dynamic "health_checked_targets" {
            for_each = wrr.value.health_checked_targets
            content {
              external_endpoints = health_checked_targets.value.external_endpoints

              dynamic "internal_load_balancers" {
                for_each = health_checked_targets.value.internal_load_balancers
                content {
                  ip_address         = internal_load_balancers.value.ip_address
                  ip_protocol        = internal_load_balancers.value.ip_protocol
                  load_balancer_type = internal_load_balancers.value.load_balancer_type
                  network_url        = internal_load_balancers.value.network_url
                  port               = internal_load_balancers.value.port
                  project            = internal_load_balancers.value.project
                  region             = internal_load_balancers.value.region
                }
              }

            }
          }

        }
      }

    }
  }

}
