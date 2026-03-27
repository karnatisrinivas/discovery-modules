variables {
  crypto_key_id = "id"
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  members       = ["user:jane@example.com"]

  condition = [{
    title       = "expires_after_2019_12_31"
    description = "Expiring at midnight of 2019-12-31"
    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  }]
}

run "test" {
  command = plan

  assert {
    condition     = google_kms_crypto_key_iam_binding.this.crypto_key_id == "id"
    error_message = "google_kms_crypto_key_iam_binding did not create correctly"
  }
}