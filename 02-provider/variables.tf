variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "region" {
  type        = string
  description = "Regione Google Cloud"
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  description = "Zona Google Cloud"
  default     = "europe-west1-b"
}
