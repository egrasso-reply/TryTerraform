variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "region" {
  type        = string
  description = "Regione Google Cloud"
  default     = "europe-west8"
}

variable "environment" {
  type        = string
  description = "Ambiente da utilizzare"
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "L'environment deve essere dev, test oppure prod."
  }
}
