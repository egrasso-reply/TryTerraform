variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "region" {
  type        = string
  description = "Regione Google Cloud"
  default     = "europe-west8"
}
