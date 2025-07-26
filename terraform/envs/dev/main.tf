provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "postgresql" {
  source        = "../../modules/postgresql"
  instance_name = "postgresql-instance-dev"
  machine_type  = "f1-micro"
  environment   = "dev"
  project       = var.project
  region        = var.region
  zone          = var.zone
}
