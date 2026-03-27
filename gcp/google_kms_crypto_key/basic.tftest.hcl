variables {
  name                          = "key"
  key_ring                      = "ring"
  rotation_period               = "864001s"
  purpose                       = "ENCRYPT_DECRYPT"
  destroy_scheduled_duration    = "30s"
  import_only                   = true
  crypto_key_backend            = "projects//locations//ekmConnections/*"
  skip_initial_version_creation = true
  version_template = [
    {
      algorithm        = "CRYPTO_KEY_VERSION_ALGORITHM_UNSPECIFIED"
      protection_level = "SOFTWARE"
    }
  ]
  labels = {}
}

run "test" {
  command = plan

  assert {
    condition     = google_kms_crypto_key.this.name == "key"
    error_message = "google_kms_crypto_key did not create correctly"
  }
}