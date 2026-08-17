# Dopo terraform apply:
#   terraform state list
#     -> google_storage_bucket.demo[0], [1], [2]
#
# Poi prova a ridurre instance_count (es. a 2 in terraform.tfvars) e lancia:
#   terraform plan
#     -> Terraform pianifica la distruzione dell'elemento in eccesso
resource "google_storage_bucket" "demo" {
  count = var.instance_count

  name     = "${var.project_id}-count-${count.index + 1}"
  location = "EU"

  uniform_bucket_level_access = true
}
