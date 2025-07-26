
resource "google_compute_firewall" "allow_prefect_ports" {
  name    = var.policy_name
  network = var.network_name

  allow {
    protocol = var.allow_protocol
    ports    = var.allow_ports
  }

  source_ranges = var.source_ranges
  description   = var.description
}

