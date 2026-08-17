variable "environment" {
  type        = string
  description = "Ambiente di esempio"
  default     = "dev"
}

variable "servers" {
  type        = list(string)
  description = "Nomi dei server di esempio"

  default = [
    "web",
    "api",
    "worker"
  ]
}

variable "common_labels" {
  type        = map(string)
  description = "Label comuni di esempio"

  default = {
    managed_by = "terraform"
    team       = "cloud"
  }
}
