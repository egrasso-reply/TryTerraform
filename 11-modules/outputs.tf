output "bucket_name" {
  value = module.demo_bucket.bucket_name
}

output "bucket_url" {
  value = module.demo_bucket.bucket_url
}

output "fabric_bucket_name" {
  value = module.demo_bucket_fabric.name
}

output "fabric_bucket_url" {
  value = module.demo_bucket_fabric.url
}
