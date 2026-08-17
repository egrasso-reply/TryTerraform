output "network_name" {
  value = google_compute_network.demo.name
}

output "subnetwork_cidr" {
  value = google_compute_subnetwork.demo.ip_cidr_range
}
