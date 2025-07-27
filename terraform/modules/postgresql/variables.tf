variable "project" {
  description = "The GCP project ID where resources will be created"
  type        = string
}
variable "region" {
  type = string
}
variable "zone" {
  type = string
}
variable "instance_name" {
    type = string
}
variable "machine_type" {
  type = string
}
variable "boot_image" {
  type = string
  default = "debian-cloud/debian-12"
}
variable "environment" {
  type = string
}

variable "description" {
  type = string
}

variable "tags" {
  description = "Etiquetas de red para la instancia (firewall rules, etc.)"
  type        = list(string)
  default     = []
}

variable "provisioning_model" {
  type = string
}

variable "preemptible" {
  type = bool
  default = true
}

variable "automatic_restart" {
  type = bool
  default = false
}
variable "network_name" {
  type = string
}
variable "ssh_public_key" {
  description = "Llave pública SSH para acceso a la VM"
  type        = string
}
