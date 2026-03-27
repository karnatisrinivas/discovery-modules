resource "google_cloudfunctions2_function_iam_policy" "this" {
  cloud_function = var.cloud_function
  policy_data    = var.policy_data
  location       = var.location
}
