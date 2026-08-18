resource "google_storage_bucket" "state_demo" {
  name     = var.bucket_name
  location = "europe-west8"

  uniform_bucket_level_access = true
}
