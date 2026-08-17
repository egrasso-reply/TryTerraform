variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "instance_count" {
  type        = number
  description = "Numero di bucket da creare"
  default     = 3
}
