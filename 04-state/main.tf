resource "google_storage_bucket" "state_demo" {
  name     = var.bucket_name
  location = "EU"

  uniform_bucket_level_access = true
}
