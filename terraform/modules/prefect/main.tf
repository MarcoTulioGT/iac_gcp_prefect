

resource "google_compute_instance" "prefect_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  tags = var.tags
  metadata = {
    description = var.description
    ssh-keys = "debian:${var.ssh_public_key}"
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
    provisioning_model = var.provisioning_model
    preemptible        = var.preemptible
    automatic_restart  = var.automatic_restart
  }

  network_interface {
    network = var.network_name
    access_config {}
  }
}
