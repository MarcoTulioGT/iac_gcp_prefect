

resource "google_compute_instance" "postgresql_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  tags = var.tags 
  metadata = {
    description = var.description
  }
  labels = {
  env         = var.environment
  description = var.description
}
  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  scheduling {
    provisioning_model = "SPOT"
    preemptible        = true
    automatic_restart  = false
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
