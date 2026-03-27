resource "google_cloud_run_v2_service" "this" {
  name                = var.name
  deletion_protection = var.deletion_protection
  location            = var.location
  description         = var.description
  labels              = var.labels
  ingress             = var.ingress



  launch_stage = var.launch_stage

  dynamic "template" {
    for_each = var.template
    content {
      revision = template.value.revision

      dynamic "containers" {
        for_each = template.value.containers
        content {
          name    = containers.value.name
          image   = containers.value.image
          command = containers.value.command == null ? null : containers.value.command

          dynamic "resources" {
            for_each = containers.value.resources
            content {
              limits = {
                "cpu"            = resources.value.cpu
                "memory"         = resources.value.memory
                "nvidia.com/gpu" = resources.value.nvidia_com_gpu
              }
              startup_cpu_boost = resources.value.startup_cpu_boost
            }
          }

          dynamic "env" {
            for_each = containers.value.env
            content {
              name  = env.value.name
              value = env.value.value
            }
          }

          dynamic "ports" {
            for_each = containers.value.ports
            content {
              name           = ports.value.name
              container_port = ports.value.container_port
            }
          }

          liveness_probe {
            initial_delay_seconds = containers.value.liveness_initial_delay_seconds
            period_seconds        = containers.value.liveness_period_seconds
            timeout_seconds       = containers.value.liveness_timeout_seconds
            failure_threshold     = containers.value.liveness_failure_threshold
            http_get {
              path = containers.value.liveness_path
              port = containers.value.liveness_port
            }
          }

          startup_probe {
            initial_delay_seconds = containers.value.startup_initial_delay_seconds
            period_seconds        = containers.value.startup_period_seconds
            timeout_seconds       = containers.value.startup_timeout_seconds
            failure_threshold     = containers.value.startup_failure_threshold
            http_get {
              path = containers.value.startup_path
              port = containers.value.startup_port
            }
          }

          volume_mounts {
            name       = containers.value.volume_mounts_name
            mount_path = containers.value.volume_mounts_path
          }
        }
      }

      scaling {
        min_instance_count = template.value.min_instance_count
        max_instance_count = template.value.max_instance_count
      }

      timeout         = var.timeout
      service_account = var.service_account

      dynamic "volumes" {
        for_each = template.value.volumes
        content {
          name = volumes.value.name

          dynamic "secret" {
            for_each = volumes.value.secret == null ? [] : volumes.value.secret
            content {
              secret = secret.value.secret
              items {
                version = secret.value.version
                path    = secret.value.path
              }
            }
          }
        }
      }

      encryption_key = var.encryption_key
      vpc_access {
        egress    = template.value.egress
        connector = template.value.connector
        network_interfaces {
          network    = template.value.network
          subnetwork = template.value.subnetwork
        }
      }
    }
  }
}