variable "machine_type" {
  description = "Flavor dos servidores"
  default     = "f1-micro"
}

variable "region" {
  description = "Regiao onde ficará o recurso"
  default     = "us-central1"
}

variable "network" {
  description = "Rede do recurso"
  default     = "default"
}


variable "zone" {
  description = "Zona onde ficará o recurso"
  default     = "us-central1-a"
}

variable "database_version" {
  description = "Versão da database"
  default     = "MYSQL_5_7"
}

