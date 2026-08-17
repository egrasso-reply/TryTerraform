variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "environment" {
  type        = string
  description = "Ambiente da utilizzare"
  default     = "dev"
}
