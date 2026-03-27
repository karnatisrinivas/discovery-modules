resource "google_cloud_run_service" "this" {
  autogenerate_revision_name = var.autogenerate_revision_name
  location                   = var.location
  name                       = var.name

  dynamic "metadata" {
    for_each = var.metadata
    content {
      annotations = metadata.value.annotations
      labels      = metadata.value.labels
      namespace   = metadata.value.namespace
    }
  }

  dynamic "template" {
    for_each = var.template
    content {
      dynamic "metadata" {
        for_each = template.value.metadata
        content {
          annotations = metadata.value.annotations
          labels      = metadata.value.labels
          name        = metadata.value.name
          namespace   = metadata.value.namespace
        }
      }

      dynamic "spec" {
        for_each = template.value.spec
        content {
          container_concurrency = spec.value.container_concurrency
          node_selector         = spec.value.node_selector
          service_account_name  = spec.value.service_account_name
          timeout_seconds       = spec.value.timeout_seconds

          dynamic "containers" {
            for_each = spec.value.containers
            content {
              args        = containers.value.args
              command     = containers.value.command
              image       = containers.value.image
              name        = containers.value.name
              working_dir = containers.value.working_dir

              dynamic "env" {
                for_each = containers.value.env
                content {
                  name  = env.value.name
                  value = env.value.value

                  dynamic "value_from" {
                    for_each = env.value.value_from
                    content {
                      dynamic "secret_key_ref" {
                        for_each = value_from.value.secret_key_ref
                        content {
                          key  = secret_key_ref.value.key
                          name = secret_key_ref.value.name
                        }
                      }

                    }
                  }

                }
              }

              dynamic "env_from" {
                for_each = containers.value.env_from
                content {
                  prefix = env_from.value.prefix

                  dynamic "config_map_ref" {
                    for_each = env_from.value.config_map_ref
                    content {
                      optional = config_map_ref.value.optional

                      dynamic "local_object_reference" {
                        for_each = config_map_ref.value.local_object_reference
                        content {
                          name = local_object_reference.value.name
                        }
                      }

                    }
                  }

                  dynamic "secret_ref" {
                    for_each = env_from.value.secret_ref
                    content {
                      optional = secret_ref.value.optional

                      dynamic "local_object_reference" {
                        for_each = secret_ref.value.local_object_reference
                        content {
                          name = local_object_reference.value.name
                        }
                      }

                    }
                  }

                }
              }

              dynamic "liveness_probe" {
                for_each = containers.value.liveness_probe
                content {
                  failure_threshold     = liveness_probe.value.failure_threshold
                  initial_delay_seconds = liveness_probe.value.initial_delay_seconds
                  period_seconds        = liveness_probe.value.period_seconds
                  timeout_seconds       = liveness_probe.value.timeout_seconds

                  dynamic "grpc" {
                    for_each = liveness_probe.value.grpc
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }

                  dynamic "http_get" {
                    for_each = liveness_probe.value.http_get
                    content {
                      path = http_get.value.path
                      port = http_get.value.port

                      dynamic "http_headers" {
                        for_each = http_get.value.http_headers
                        content {
                          name  = http_headers.value.name
                          value = http_headers.value.value
                        }
                      }

                    }
                  }

                }
              }

              dynamic "ports" {
                for_each = containers.value.ports
                content {
                  container_port = ports.value.container_port
                  name           = ports.value.name
                  protocol       = ports.value.protocol
                }
              }

              dynamic "resources" {
                for_each = containers.value.resources
                content {
                  limits   = resources.value.limits
                  requests = resources.value.requests
                }
              }

              dynamic "startup_probe" {
                for_each = containers.value.startup_probe
                content {
                  failure_threshold     = startup_probe.value.failure_threshold
                  initial_delay_seconds = startup_probe.value.initial_delay_seconds
                  period_seconds        = startup_probe.value.period_seconds
                  timeout_seconds       = startup_probe.value.timeout_seconds

                  dynamic "grpc" {
                    for_each = startup_probe.value.grpc
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }

                  dynamic "http_get" {
                    for_each = startup_probe.value.http_get
                    content {
                      path = http_get.value.path
                      port = http_get.value.port

                      dynamic "http_headers" {
                        for_each = http_get.value.http_headers
                        content {
                          name  = http_headers.value.name
                          value = http_headers.value.value
                        }
                      }

                    }
                  }

                  dynamic "tcp_socket" {
                    for_each = startup_probe.value.tcp_socket
                    content {
                      port = tcp_socket.value.port
                    }
                  }

                }
              }

              dynamic "volume_mounts" {
                for_each = containers.value.volume_mounts
                content {
                  mount_path = volume_mounts.value.mount_path
                  name       = volume_mounts.value.name
                }
              }

            }
          }

          dynamic "volumes" {
            for_each = spec.value.volumes
            content {
              name = volumes.value.name

              dynamic "csi" {
                for_each = volumes.value.csi
                content {
                  driver            = csi.value.driver
                  read_only         = csi.value.read_only
                  volume_attributes = csi.value.volume_attributes
                }
              }

              dynamic "empty_dir" {
                for_each = volumes.value.empty_dir
                content {
                  medium     = empty_dir.value.medium
                  size_limit = empty_dir.value.size_limit
                }
              }

              dynamic "nfs" {
                for_each = volumes.value.nfs
                content {
                  path      = nfs.value.path
                  read_only = nfs.value.read_only
                  server    = nfs.value.server
                }
              }

              dynamic "secret" {
                for_each = volumes.value.secret
                content {
                  default_mode = secret.value.default_mode
                  secret_name  = secret.value.secret_name

                  dynamic "items" {
                    for_each = secret.value.items
                    content {
                      key  = items.value.key
                      mode = items.value.mode
                      path = items.value.path
                    }
                  }

                }
              }

            }
          }

        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  dynamic "traffic" {
    for_each = var.traffic
    content {
      latest_revision = traffic.value.latest_revision
      percent         = traffic.value.percent
      revision_name   = traffic.value.revision_name
      tag             = traffic.value.tag
    }
  }

}
