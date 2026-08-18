terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

# Il provider non ha credenziali esplicite: usa le Application Default
# Credentials del tuo utente. Prima di lanciare terraform plan/apply serve:
#   gcloud auth application-default login
# Senza, Terraform fallisce con un errore di autenticazione.
provider "google" {
  project = var.project_id
  region  = var.region
}
