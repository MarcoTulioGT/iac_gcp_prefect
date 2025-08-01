terraform {
  backend "gcs" {
    bucket = "backend-terraform25"
    prefix = "dev/terraform/state_posgresql-prefect"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}
