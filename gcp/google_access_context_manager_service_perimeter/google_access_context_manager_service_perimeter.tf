resource "google_access_context_manager_service_perimeter" "this" {
  description               = var.description
  name                      = var.name
  parent                    = var.parent
  perimeter_type            = var.perimeter_type
  title                     = var.title
  use_explicit_dry_run_spec = var.use_explicit_dry_run_spec

  dynamic "spec" {
    for_each = var.spec
    content {
      access_levels       = spec.value.access_levels
      resources           = spec.value.resources
      restricted_services = spec.value.restricted_services

      dynamic "egress_policies" {
        for_each = spec.value.egress_policies
        content {
          title = egress_policies.value.title

          dynamic "egress_from" {
            for_each = egress_policies.value.egress_from
            content {
              identities         = egress_from.value.identities
              identity_type      = egress_from.value.identity_type
              source_restriction = egress_from.value.source_restriction

              dynamic "sources" {
                for_each = egress_from.value.sources
                content {
                  access_level = sources.value.access_level
                  resource     = sources.value.resource
                }
              }

            }
          }

          dynamic "egress_to" {
            for_each = egress_policies.value.egress_to
            content {
              external_resources = egress_to.value.external_resources
              resources          = egress_to.value.resources
              roles              = egress_to.value.roles

              dynamic "operations" {
                for_each = egress_to.value.operations
                content {
                  service_name = operations.value.service_name

                  dynamic "method_selectors" {
                    for_each = operations.value.method_selectors
                    content {
                      method     = method_selectors.value.method
                      permission = method_selectors.value.permission
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "ingress_policies" {
        for_each = spec.value.ingress_policies
        content {
          title = ingress_policies.value.title

          dynamic "ingress_from" {
            for_each = ingress_policies.value.ingress_from
            content {
              identities    = ingress_from.value.identities
              identity_type = ingress_from.value.identity_type

              dynamic "sources" {
                for_each = ingress_from.value.sources
                content {
                  access_level = sources.value.access_level
                  resource     = sources.value.resource
                }
              }

            }
          }

          dynamic "ingress_to" {
            for_each = ingress_policies.value.ingress_to
            content {
              resources = ingress_to.value.resources
              roles     = ingress_to.value.roles

              dynamic "operations" {
                for_each = ingress_to.value.operations
                content {
                  service_name = operations.value.service_name

                  dynamic "method_selectors" {
                    for_each = operations.value.method_selectors
                    content {
                      method     = method_selectors.value.method
                      permission = method_selectors.value.permission
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "vpc_accessible_services" {
        for_each = spec.value.vpc_accessible_services
        content {
          allowed_services   = vpc_accessible_services.value.allowed_services
          enable_restriction = vpc_accessible_services.value.enable_restriction
        }
      }

    }
  }

  dynamic "status" {
    for_each = var.status
    content {
      access_levels       = status.value.access_levels
      resources           = status.value.resources
      restricted_services = status.value.restricted_services

      dynamic "egress_policies" {
        for_each = status.value.egress_policies
        content {
          title = egress_policies.value.title

          dynamic "egress_from" {
            for_each = egress_policies.value.egress_from
            content {
              identities         = egress_from.value.identities
              identity_type      = egress_from.value.identity_type
              source_restriction = egress_from.value.source_restriction

              dynamic "sources" {
                for_each = egress_from.value.sources
                content {
                  access_level = sources.value.access_level
                  resource     = sources.value.resource
                }
              }

            }
          }

          dynamic "egress_to" {
            for_each = egress_policies.value.egress_to
            content {
              external_resources = egress_to.value.external_resources
              resources          = egress_to.value.resources
              roles              = egress_to.value.roles

              dynamic "operations" {
                for_each = egress_to.value.operations
                content {
                  service_name = operations.value.service_name

                  dynamic "method_selectors" {
                    for_each = operations.value.method_selectors
                    content {
                      method     = method_selectors.value.method
                      permission = method_selectors.value.permission
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "ingress_policies" {
        for_each = status.value.ingress_policies
        content {
          title = ingress_policies.value.title

          dynamic "ingress_from" {
            for_each = ingress_policies.value.ingress_from
            content {
              identities    = ingress_from.value.identities
              identity_type = ingress_from.value.identity_type

              dynamic "sources" {
                for_each = ingress_from.value.sources
                content {
                  access_level = sources.value.access_level
                  resource     = sources.value.resource
                }
              }

            }
          }

          dynamic "ingress_to" {
            for_each = ingress_policies.value.ingress_to
            content {
              resources = ingress_to.value.resources
              roles     = ingress_to.value.roles

              dynamic "operations" {
                for_each = ingress_to.value.operations
                content {
                  service_name = operations.value.service_name

                  dynamic "method_selectors" {
                    for_each = operations.value.method_selectors
                    content {
                      method     = method_selectors.value.method
                      permission = method_selectors.value.permission
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "vpc_accessible_services" {
        for_each = status.value.vpc_accessible_services
        content {
          allowed_services   = vpc_accessible_services.value.allowed_services
          enable_restriction = vpc_accessible_services.value.enable_restriction
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

}
