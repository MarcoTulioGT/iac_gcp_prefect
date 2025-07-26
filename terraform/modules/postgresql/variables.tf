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
  default = "debian-cloud/debian-12"
}
variable "environment" {
  type = string
}