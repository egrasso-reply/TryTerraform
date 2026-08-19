variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud già esistente da gestire"
}

variable "demo_member" {
  type        = string
  description = "Principal di test per il binding IAM additive, stesso concetto del capitolo 12, formato \"user:email\" o \"group:email\""
}
