variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "demo_member" {
  type        = string
  description = "Principal di test su cui dimostrare i binding IAM, formato \"user:email\" o \"group:email\" - scelto apposta per non toccare permessi reali di altri"
}
