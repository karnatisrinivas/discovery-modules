variables {
  metadata_startup_script    = ""
  deletion_protection        = false
  desired_status             = ""
  enable_display             = false
  key_revocation_action_type = ""
  metadata                   = {}
  allow_stopping_for_update  = false
  name                       = ""
  can_ip_forward             = false
  description                = ""
  hostname                   = ""
  labels                     = {}
  machine_type               = ""
  resource_policies          = []
  tags                       = []
  shielded_instance_config   = []
  service_account            = []
}
run "test" {
  command = plan
  assert {
    condition     = google_compute_instance.this.name != null
    error_message = "google_compute_instance was not succesful"
  }
}
