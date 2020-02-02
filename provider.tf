# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file("../turma03-infraagil-260200-2ef19bb5e0c1.json")
  project     = "turma03-infraagil-260200"
  region      = var.region
}
