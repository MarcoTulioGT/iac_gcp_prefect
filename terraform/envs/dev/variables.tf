variable "project" {
  description = "ID del proyecto de GCP"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Región donde se crean los recursos"
  type        = string
}

variable "zone" {
  description = "Zona específica dentro de la región"
  type        = string
}

variable "ssh_public_key" {
  description = "Llave pública SSH para acceso a la VM"
  type        = string
  sensitive   = true
}
