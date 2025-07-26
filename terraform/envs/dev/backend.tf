terraform {
  backend "gcs" {
    bucket = "backend-terraform25"
    prefix = "dev/terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}
