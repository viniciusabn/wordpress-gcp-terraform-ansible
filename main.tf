# Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name          = "worspress"
  machine_type  = var.machine_type
  zone          = var.zone

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20191113"
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = var.network
    access_config {
    }
  }
}


resource "google_sql_database_instance" "database" {
  name             = "database1"
  database_version = var.database_version
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}
