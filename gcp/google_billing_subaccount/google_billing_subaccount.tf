resource "google_billing_subaccount" "this" {
  deletion_policy        = var.deletion_policy
  display_name           = var.display_name
  master_billing_account = var.master_billing_account

}
