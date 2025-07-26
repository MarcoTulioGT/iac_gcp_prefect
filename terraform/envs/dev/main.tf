provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "postgresql_vm" {
  source        = "../../modules/postgresql_vm"
  instance_name = "postgresql-instance-dev"
  machine_type  = "f1-micro"
  environment   = "dev"
}