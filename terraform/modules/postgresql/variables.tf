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

variable "instance_name" {}
variable "machine_type" {
  default = "f1-micro"
}
variable "boot_image" {
  default = "debian-cloud/debian-12"
}
variable "environment" {
  default = "dev"
}