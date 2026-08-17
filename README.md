# TryTerraform

Corso introduttivo a Terraform su Google Cloud Platform, organizzato in
capitoli progressivi. Ogni cartella `NN-argomento/` è un root module
Terraform indipendente, pensato per essere eseguito e distrutto singolarmente
durante la lezione.

## Prerequisiti

- [Terraform](https://developer.hashicorp.com/terraform/install) (testato
  con 1.15.8)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) (`gcloud`)
- Accesso al progetto GCP del corso, autenticato con il proprio account
  personale (non serve nessuna chiave di Service Account):

  ```
  gcloud auth application-default login
  ```

## Struttura del corso

| Capitolo | Argomento | Crea risorse reali? |
| --- | --- | --- |
| [01-resource](01-resource) | Prima risorsa: un bucket GCS | Sì |
| [02-variables](02-variables) | Variabili, `locals`, `validation` | Sì |
| [03-provider](03-provider) | Configurazione del provider, data source | Sì |
| [04-state](04-state) | Backend remoto su GCS per lo state | Sì |
| [05-import](05-import) | Import di risorse esistenti | Sì |
| [06-count](06-count) | Risorse multiple con `count` | Sì |
| [07-for-each](07-for-each) | Risorse multiple con `for_each` | Sì |
| [08-dependencies](08-dependencies) | Dipendenze esplicite e implicite | Sì |
| [09-expressions](09-expressions) | Espressioni e funzioni HCL | No |
| [10-dynamic](10-dynamic) | Blocchi `dynamic` | Sì |
| [11-modules](11-modules) | Moduli: locale vs Cloud Foundation Fabric | Sì |

## Come si lancia un capitolo

Pattern generale, valido per la maggior parte dei capitoli:

```bash
cd NN-argomento
cp terraform.tfvars.example terraform.tfvars   # compila i tuoi valori
terraform init
terraform plan
terraform apply
# ... esplora la demo (vedi i commenti in main.tf di ogni capitolo) ...
terraform destroy
```

Ogni `main.tf` contiene commenti con la sequenza di comandi specifica della
demo (es. `terraform state list`, override con `-var`, ecc.).

### Eccezioni al pattern generale

- **09-expressions**: nessun `terraform.tfvars` (tutte le variabili hanno un
  default) e nessun provider — non crea nulla su GCP, quindi non serve
  nemmeno `terraform destroy`.
- **05-import**: prima di `terraform init` va creato un bucket **a mano**
  (Console o `gcloud`) con lo stesso nome che poi va in `bucket_name`; è
  quello il bucket da importare.
- **04-state**: dopo il primo `apply` con backend locale, si può rinominare
  `backend.tf.example` in `backend.tf` (con bucket e SA di stato reali) per
  mostrare la migrazione a un backend remoto GCS.

## Note operative

- I `terraform.tfvars` compilati con i valori reali **non vanno committati**
  (sono esclusi da `.gitignore`) — si committano solo i `*.tfvars.example`.
- `.terraform.lock.hcl` **va committato**: garantisce che chiunque lanci
  `terraform init` ottenga le stesse versioni dei provider.
- Riusando lo stesso progetto GCP capitolo dopo capitolo, conviene lanciare
  `terraform destroy` a fine demo: alcuni nomi di risorsa sono fissi (non
  variano da un'esecuzione all'altra) e una risorsa lasciata in giro fa
  fallire il prossimo `apply` con "already exists".

## Licenza

[MIT](LICENSE)
