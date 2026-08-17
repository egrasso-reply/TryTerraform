# Prova a lanciare: terraform plan -var="environment=pippo"
# per vedere la validation su var.environment in azione
resource "google_storage_bucket" "example" {
  name     = local.bucket_name
  location = "EU"

  uniform_bucket_level_access = true

  labels = local.common_labels
}
