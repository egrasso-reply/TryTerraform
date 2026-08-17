output "bucket_names" {
  value = google_storage_bucket.demo[*].name
}
