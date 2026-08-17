# Input -> Module -> Output:
#   name/location/labels entrano nel modulo ./modules/bucket,
#   il modulo crea la risorsa reale, e riespone bucket_name/bucket_url
#   come propri output (vedi modules/bucket/outputs.tf), che il root
#   module rilancia in outputs.tf.
module "demo_bucket" {
  source = "./modules/bucket"

  name     = "${var.project_id}-${var.environment}-module-demo"
  location = "EU"

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
