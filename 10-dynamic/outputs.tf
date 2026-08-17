output "firewall_name" {
  value = google_compute_firewall.web.name
}

output "allowed_ports" {
  value = var.allowed_ports
}
