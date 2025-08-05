provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "network" {
  source         = "../../modules/network"
  environment    = "dev"
  project        = var.project
  region         = var.region
  zone           = var.zone
  network_name   = "default"
  policy_name    = "allow-prefect-ports"
  allow_protocol = "tcp"
  allow_ports    = ["22", "8080", "3000", "4200", "5432"]
  source_ranges  = ["0.0.0.0/0"]
  description    = "Allow SSH, HTTP app, and other custom ports"
}
module "postgresql" {
  source             = "../../modules/postgresql"
  instance_name      = "postgresql-instance-dev"
  machine_type       = "f1-micro"
  environment        = "dev"
  project            = var.project
  region             = var.region
  zone               = var.zone
  description        = "postgresql-instance-for-development-environment"
  provisioning_model = "SPOT"
  preemptible        = true
  automatic_restart  = false
  boot_image         = "debian-cloud/debian-12" #ubuntu-os-cloud/ubuntu-minimal-2204-lts,debian-cloud/debian-12"
  network_name       = "default"
  ssh_public_key     = var.ssh_public_key
}

module "prefect" {
  source             = "../../modules/prefect"
  instance_name      = "prefect-instance-dev"
  machine_type       = "e2-micro"
  environment        = "dev"
  project            = var.project
  region             = var.region
  zone               = var.zone
  description        = "prefect-instance-for-development-environment"
  provisioning_model = "SPOT"
  preemptible        = true
  automatic_restart  = false
  boot_image         = "debian-cloud/debian-12" #ubuntu-os-cloud/ubuntu-minimal-2204-lts,debian-cloud/debian-12"
  network_name       = "default"
  ssh_public_key     = var.ssh_public_key
}
#module "ansible_inventory" {
#  source         = "../../modules/ansible_inventory"
#  path_ansible   = "${path.module}/../../ansible"
#  postgresql_instance_dev_ip  = google_compute_instance.postgresql_instance.network_interface[0].access_config[0].nat_ip
#}