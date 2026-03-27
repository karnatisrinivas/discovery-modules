resource "google_compute_instance_iam_policy" "this" {
  instance_name = var.instance_name
  policy_data   = var.policy_data
  zone          = var.zone

}
