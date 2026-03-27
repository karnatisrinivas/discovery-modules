#tftest.hcl
variables {
  region                         = "us-east-1"
  env                            = "test"
  authentication_profile_name    = "master-test-redshift-profile"
  authentication_profile_content = <<JSON
  {
      "AllowDBUserOverride" : "1",
      "Client_ID"           : "ExampleClientID",
      "App_ID"              : "example"
    }
    JSON
}

run "validate" {

  command = plan
  assert {
    condition     = aws_redshift_authentication_profile.this[0].authentication_profile_name == "master-test-redshift-profile"
    error_message = "Redshift authentication profile name is not correct"
  }
}