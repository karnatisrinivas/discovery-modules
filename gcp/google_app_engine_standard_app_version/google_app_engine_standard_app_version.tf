locals {
  has_zip = var.zip_source_url != null
}

resource "google_app_engine_standard_app_version" "this" {
  runtime = var.runtime
  service = var.service

  entrypoint {
    shell = var.shell
  }

  dynamic "deployment" {
    for_each = local.has_zip || length(var.files) > 0 ? [1] : []
    content {
      dynamic "zip" {
        for_each = local.has_zip ? [1] : []
        content {
          source_url  = var.zip_source_url
          files_count = var.zip_files_count
        }
      }

      dynamic "files" {
        for_each = var.files
        content {
          name       = files.value.name
          sha1_sum   = files.value.sha1_sum
          source_url = files.value.source_url
        }
      }
    }
  }
}