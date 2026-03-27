data "google_active_folder" "this" {
  api_method   = var.api_method
  display_name = var.display_name
  parent       = var.parent

}
