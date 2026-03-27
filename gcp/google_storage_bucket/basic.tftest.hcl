variables {
  name                        = "bucket"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
  index_page                  = "index.html"
  error_page                  = "error.html"
  cors_origin                 = ["http://image-store.com"]
  cors_method                 = ["GET", "HEAD", "PUT", "POST", "DELETE"]
  cors_response_header        = ["*"]
  cors_max_age_seconds        = 3600
  enable_versioning           = true
  encryption                  = []
  storage_class               = "STANDARD"
  autoclass = [
    {
      enabled                = true
      terminal_storage_class = "NEARLINE"
    }
  ]
  lifecycle_rule = []
  versioning = [
    {
      enabled = true
    }
  ]
  website = [
    {
      main_page_suffix = "page"
      not_found_page   = "error"
    }
  ]
  cors = [
    {
      origin          = ["a"]
      method          = ["GET"]
      response_header = ["header"]
      max_age_seconds = 3
    }
  ]
  default_event_based_hold = true
  retention_policy = [
    {
      is_locked        = true
      retention_period = 123123
    }
  ]
  enable_object_retention  = true
  requester_pays           = true
  rpo                      = "DEFAULT"
  public_access_prevention = "inherited"
  soft_delete_policy = [
    {
      retention_duration_seconds = 604800
    }
  ]
  labels = {}
}

run "test" {
  command = plan

  assert {
    condition     = google_storage_bucket.this.name == "bucket"
    error_message = "google_storage_bucket did not create correctly"
  }
}