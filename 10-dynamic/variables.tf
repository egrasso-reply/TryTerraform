variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "allowed_ports" {
  type        = list(string)
  description = "Porte TCP da aprire in ingresso sulla firewall rule"

  default = [
    "80",
    "443"
  ]
}
