# Input -> Module -> Output:
#   name/location/labels entrano nel modulo ./modules/bucket,
#   il modulo crea la risorsa reale, e riespone bucket_name/bucket_url
#   come propri output (vedi modules/bucket/outputs.tf), che il root
#   module rilancia in outputs.tf.
module "demo_bucket" {
  source = "./modules/bucket"

  name     = "${var.project_id}-${var.environment}-module-demo"
  location = "europe-west8"

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

# Stesso identico obiettivo, ma con un modulo pubblico mantenuto da Google
# (Cloud Foundation Fabric) invece che scritto a mano. Buono per mostrare
# la differenza tra "modulo fatto in casa" e "modulo maturo, testato,
# versionato" che si scarica da terraform init (richiede rete verso GitHub).
#
# ref pinnato a v57.0.0: verifica che sia ancora l'ultimo tag stabile su
# https://github.com/GoogleCloudPlatform/cloud-foundation-fabric/tags
# prima della lezione.
module "demo_bucket_fabric" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/gcs?ref=v57.0.0"
  project_id = var.project_id
  name       = "${var.project_id}-${var.environment}-fabric-demo"
  location   = "EU"

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
