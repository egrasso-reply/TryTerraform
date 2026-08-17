locals {
  bucket_name = "${var.project_id}-${var.environment}-variables-demo"

  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
