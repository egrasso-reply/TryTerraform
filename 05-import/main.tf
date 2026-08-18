# Demo import: prima crea il bucket A MANO dalla Console GCP (stesso nome
# che metterai in bucket_name dentro terraform.tfvars, vedi
# terraform.tfvars.example), poi:
#
#   terraform init
#   terraform state list
#     -> vuoto: Terraform non conosce ancora questo bucket
#
#   terraform import google_storage_bucket.imported NOME_BUCKET_CREATO_A_MANO
#   terraform state list
#     -> compare google_storage_bucket.imported
#
#   terraform plan
#     -> nessuna modifica: la risorsa importata combacia gia' col codice
#
# In alternativa al comando `terraform import`, vedi l'approccio dichiarativo
# in import.tf.example.
#
# Per mostrare che lo state è solo una "vista" di Terraform sulla realta',
# non la realta' stessa:
#
#   terraform state rm google_storage_bucket.imported
#
# il bucket continua ad esistere davvero su GCP, Terraform ha solo smesso
# di tracciarlo.
resource "google_storage_bucket" "imported" {
  name     = var.bucket_name
  location = "europe-west8"

  uniform_bucket_level_access = true
}
