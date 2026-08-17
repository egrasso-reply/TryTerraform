# Nessuna risorsa reale in questo capitolo: terraform apply mostra subito
# i risultati via output, senza toccare GCP. Ottimo per una demo veloce.
#
# Prova anche in modo interattivo:
#   terraform console
#     > upper("terraform")
#     > min(55, 3453, 2)
#     > split("-", "terraform-training-demo")
#     > [for n in ["web", "api"] : upper(n)]
locals {
  # Conditional expression
  machine_type = var.environment == "prod" ? "e2-medium" : "e2-micro"

  # Function
  environment_upper = upper(var.environment)

  # For expression
  server_names = [
    for server in var.servers :
    "${var.environment}-${server}"
  ]

  # merge()
  labels = merge(
    var.common_labels,
    {
      environment = var.environment
    }
  )

  # split()
  example_split = split("-", "terraform-training-demo")
}
