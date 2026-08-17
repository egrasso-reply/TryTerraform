# Dopo terraform apply:
#   terraform state list
#     -> google_storage_bucket.environment["dev"], ["prod"], ["test"]
#     (a differenza di count, la chiave e' il valore stesso, non un indice)
#
# Poi togli "test" da environments (in terraform.tfvars) e lancia:
#   terraform plan
#     -> Terraform pianifica la distruzione solo di ["test"], gli altri
#        bucket non vengono toccati. Con count, rimuovere un elemento in
#        mezzo alla lista avrebbe fatto ricreare tutti gli indici successivi:
#        e' il motivo per cui for_each e' preferibile quando gli elementi
#        hanno un'identita' propria (qui il nome dell'ambiente).
resource "google_storage_bucket" "environment" {
  for_each = var.environments

  name     = "${var.project_id}-${each.key}-foreach"
  location = "EU"

  uniform_bucket_level_access = true

  labels = {
    environment = each.key
  }
}
