# Il modulo "project" di Fabric NON crea il progetto: project_reuse punta a
# uno gia' esistente (qui, il progetto del corso) tramite una data source
# interna al modulo, e lo gestisce da li' in poi (API, IAM, policy...).
# E' esattamente lo scenario del workshop: il progetto esiste gia', creato
# a mano, e Terraform prende in carico solo la sua gestione.
#
# Stessa distinzione authoritative/non-authoritative del capitolo 12, ma nel
# vocabolario di Fabric:
#   iam / iam_bindings / iam_by_principals             -> AUTHORITATIVE
#   iam_bindings_additive / iam_by_principals_additive -> ADDITIVE (sicuro)
module "project" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/project?ref=v57.0.0"

  name = var.project_id

  project_reuse = {
    use_data_source = true
  }

  services = [
    "storage.googleapis.com",
    "compute.googleapis.com",
  ]

  # Additive: aggiunge il binding senza toccare permessi gia' presenti sul
  # progetto - stessa logica sicura di google_project_iam_member nel
  # capitolo 12, qui gestita dal modulo invece che a mano.
  iam_by_principals_additive = {
    (var.demo_member) = ["roles/logging.viewer"]
  }
}
