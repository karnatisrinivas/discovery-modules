variables {
  name        = "demo-service"
  location    = "us-west2"
  description = "A simple demo service"
  labels = {
    "env" = "dev"
  }
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"
  launch_stage        = "GA"
  timeout             = "300s"
  encryption_key      = null
  service_account     = null
  template = [
    {
      containers = [
        {
          name    = "app"
          image   = "gcr.io/cloudrun/hello:latest"
          command = []
          resources = [
            {
              cpu               = "2"
              memory            = "2Gi"
              startup_cpu_boost = true
            }
          ]
          env = [
            {
              name  = "HELLO"
              value = "8080"
            }
          ]
          ports = [
            {
              name           = "http1"
              container_port = 8080
            }
          ]
          liveness_initial_delay_seconds = 5
          liveness_period_seconds        = 10
          liveness_timeout_seconds       = 2
          liveness_failure_threshold     = 3
          startup_initial_delay_seconds  = 5
          startup_period_seconds         = 10
          startup_timeout_seconds        = 2
          startup_failure_threshold      = 3
          volume_mounts_name             = "hello"
          volume_mounts_path             = "/etc/"
        }
      ]
      min_instance_count = 1
      max_instance_count = 100
      egress             = "ALL_TRAFFIC"
      network            = "default"

      volumes = [
        {
          name = "hello"
          secret = [
            {
              version = "1"
              secret  = "my-secret"
              path    = "etc/secret"
            }
          ]
        }
      ]
    }
  ]
}

run "test" {
  command = apply
  assert {
    condition     = google_cloud_run_v2_service.this.name == "demo-service"
    error_message = "Service did not get created"
  }
}