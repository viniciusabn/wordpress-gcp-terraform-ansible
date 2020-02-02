terraform {
  backend "gcs" {
    bucket = "turma03-infraagil-260200-tfstate"
    credentials = "../turma03-infraagil-260200-2ef19bb5e0c1.json"
  }
}
