resource "google_storage_bucket" "this" {
  name     = var.name
  location = var.location

  uniform_bucket_level_access = true

  labels = var.labels
}
