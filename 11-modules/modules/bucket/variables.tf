variable "name" {
  type        = string
  description = "Nome del bucket"
}

variable "location" {
  type        = string
  description = "Location del bucket"
}

variable "labels" {
  type        = map(string)
  description = "Labels da applicare al bucket"
  default     = {}
}
