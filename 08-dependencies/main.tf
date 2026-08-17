# Dipendenza esplicita: google_compute_network non referenzia
# google_project_service.compute da nessuna parte nei suoi argomenti, quindi
# senza depends_on Terraform potrebbe provare a creare la rete prima che
# l'API Compute sia abilitata sul progetto.
#
# Dipendenza implicita: google_compute_subnetwork.demo referenzia
# google_compute_network.demo.id nel proprio argomento "network" -> Terraform
# deriva l'ordine da solo, nessun depends_on necessario.
#
# Per vedere il grafo delle dipendenze risultante:
#   terraform graph
resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_compute_network" "demo" {
  name                    = "terraform-dependency-demo"
  auto_create_subnetworks = false

  depends_on = [
    google_project_service.compute
  ]
}

resource "google_compute_subnetwork" "demo" {
  name          = "terraform-dependency-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region

  network = google_compute_network.demo.id
}
