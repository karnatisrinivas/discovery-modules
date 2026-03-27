resource "google_cloudfunctions_function_iam_policy" "this" {
  cloud_function = var.cloud_function
  policy_data    = var.policy_data
}
