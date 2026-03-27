data "google_compute_instance_iam_policy" "this" {
  instance_name = var.instance_name
  zone          = var.zone

}
