variables {
  name = ""
}
run "test" {
  command = plan
  assert {
    condition     = data.google_compute_subnetwork.this.name != null
    error_message = "data.google_compute_subnetwork was not succesful"
  }
}
