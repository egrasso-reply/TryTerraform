# Tre livelli di "quanto è authoritative" un binding IAM Terraform, dal
# più sicuro al più pericoloso.

# 1) NON-authoritative / additive: aggiunge demo_member al ruolo SENZA
# toccare gli altri membri già presenti su quel ruolo (assegnati a mano,
# da console, da altri script). è la scelta di default corretta quando i
# permessi del progetto sono gestiti anche fuori da Terraform - che è
# esattamente la situazione di partenza descritta nel workshop.
resource "google_project_iam_member" "demo_additive" {
  project = var.project_id
  role    = "roles/logging.viewer"
  member  = var.demo_member
}

# 2) Authoritative SOLO per questo ruolo: dopo l'apply, roles/browser avrà
# ESATTAMENTE demo_member come unico membro - qualunque altro principal a
# cui qualcuno (a mano o un altro tool) avesse dato roles/browser su questo
# progetto viene rimosso al prossimo apply, anche se Terraform non lo ha
# mai creato lui.
#
# ATTENZIONE PRIMA DI LANCIARLO A LEZIONE: verifica chi ha già questo
# ruolo, così non sparisce nessuno per sbaglio:
#   gcloud projects get-iam-policy PROJECT_ID \
#     --flatten="bindings[].members" \
#     --filter="bindings.role:roles/browser" \
#     --format="table(bindings.members)"
# roles/browser è scelto apposta per la demo perchè è improbabile che
# qualcun altro lo abbia già su questo progetto condiviso. MAI usare
# google_project_iam_binding su un ruolo (es. roles/editor, roles/owner) di
# cui non conosci con certezza tutti i membri attuali.
resource "google_project_iam_binding" "demo_authoritative" {
  project = var.project_id
  role    = "roles/browser"
  members = [var.demo_member]
}

# 3) COMPLETAMENTE authoritative su TUTTA la IAM policy del progetto - non
# è wired in questo file, solo commentato come riferimento.
# google_project_iam_policy sostituisce l'INTERA policy IAM del progetto:
# owner, editor, ogni binding creato da chiunque (console, altri team,
# altri script) sparisce se non lo includi esplicitamente. Va evitato quasi
# sempre - NON applicare mai per davvero senza aver prima esportato e
# incluso la policy completa esistente (gcloud projects get-iam-policy).
#
#   data "google_iam_policy" "demo" {
#     binding {
#       role    = "roles/browser"
#       members = [var.demo_member]
#     }
#   }
#
#   resource "google_project_iam_policy" "demo_fully_authoritative" {
#     project     = var.project_id
#     policy_data = data.google_iam_policy.demo.policy_data
#   }
