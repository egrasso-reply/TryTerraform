variable "project_id" {
  type        = string
  description = "ID del progetto Google Cloud"
}

variable "environments" {
  type        = set(string)
  description = "Ambienti per cui creare un bucket dedicato"

  default = [
    "dev",
    "test",
    "prod"
  ]
}
