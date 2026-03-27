variables {
  secret_id = "secret"
  replication = [
    {
      "auto" : [],
      "user_managed" : [
        {
          "replicas" : [
            {
              "customer_managed_encryption" : [],
              "location" : "us-west2"
            }
          ]
        }
      ]
    }
  ]
}

run "test" {
  command = plan

  assert {
    condition     = google_secret_manager_secret.this.secret_id == "secret"
    error_message = "google_secret_manager_secret did not create correctly"
  }
}