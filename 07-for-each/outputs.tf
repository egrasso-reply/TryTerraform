output "bucket_names" {
  value = {
    for key, bucket in google_storage_bucket.environment :
    key => bucket.name
  }
}
