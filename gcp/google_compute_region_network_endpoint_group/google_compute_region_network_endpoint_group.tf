resource "google_compute_region_network_endpoint_group" "this" {
  description           = var.description
  name                  = var.name
  network               = var.network
  network_endpoint_type = var.network_endpoint_type
  psc_target_service    = var.psc_target_service
  region                = var.region
  subnetwork            = var.subnetwork

  dynamic "app_engine" {
    for_each = var.app_engine
    content {
      service  = app_engine.value.service
      url_mask = app_engine.value.url_mask
      version  = app_engine.value.version
    }
  }

  dynamic "cloud_function" {
    for_each = var.cloud_function
    content {
      function = cloud_function.value.function
      url_mask = cloud_function.value.url_mask
    }
  }

  dynamic "cloud_run" {
    for_each = var.cloud_run
    content {
      service  = cloud_run.value.service
      tag      = cloud_run.value.tag
      url_mask = cloud_run.value.url_mask
    }
  }

  dynamic "psc_data" {
    for_each = var.psc_data
    content {
      producer_port = psc_data.value.producer_port
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
