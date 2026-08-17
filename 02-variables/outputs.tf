output "bucket_name" {
  description = "Nome del bucket creato"
  value       = google_storage_bucket.example.name
}

output "environment" {
  description = "Ambiente utilizzato"
  value       = var.environment
}
