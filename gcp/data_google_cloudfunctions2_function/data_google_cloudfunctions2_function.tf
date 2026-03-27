data "google_cloudfunctions2_function" "this" {
  location = var.location
  name     = var.name

}
