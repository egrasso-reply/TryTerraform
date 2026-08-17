# Il blocco dynamic "allow" genera un blocco allow{} ripetuto per ogni
# elemento di allowed_ports. Con i default ["80", "443"] equivale a scrivere
# a mano:
#
#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }
#   allow {
#     protocol = "tcp"
#     ports    = ["443"]
#   }
#
# Utile ogni volta che serve generare N blocchi annidati ripetibili a
# partire da una lista/set, invece di scriverli uno per uno.
resource "google_compute_network" "demo" {
  name                    = "terraform-dynamic-demo"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "web" {
  name    = "terraform-dynamic-web"
  network = google_compute_network.demo.name

  direction = "INGRESS"

  source_ranges = [
    "0.0.0.0/0"
  ]

  dynamic "allow" {
    for_each = var.allowed_ports

    content {
      protocol = "tcp"
      ports    = [allow.value]
    }
  }
}
