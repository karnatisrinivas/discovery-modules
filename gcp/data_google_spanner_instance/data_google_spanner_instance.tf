data "google_spanner_instance" "this" {
  config       = var.config
  display_name = var.display_name
  name         = var.name

}
