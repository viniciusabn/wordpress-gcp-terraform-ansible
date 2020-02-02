# Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "wordpress"
  machine_type = var.machine_type
  zone         = var.zone

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

  #Conexão SSH para validar Conectividade
  provisioner "remote-exec" {
    inline = ["echo 'Liberado para o Ansible'"]

    connection {
      type        = "ssh"
      user        = "vinicius.nascimento.clc3"
      private_key = file("../id_rsa")
      host = google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip
      timeout     = "90s"
    }
  }

  # Cria o inventário do Ansible
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip} > ansible/inventory"
  }

  # Executa a playbook na máquina provisionada
  #provisioner "local-exec" {
  #  command = "ansible-playbook -i ansible/inventory --private-key ../id_rsa ansible/playbook.yml"
  #}

}

#resource "google_sql_database_instance" "helloworld" {
#  name             = "database2"
#  database_version = var.database_version
#  region           = var.region
#
#  settings {
#    tier = "db-f1-micro"
#  }
#}
