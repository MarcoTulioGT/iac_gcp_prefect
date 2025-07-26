
resource "google_compute_firewall" "allow_prefect_ports" {
  name    = "allow-prefect-ports"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "8080", "3000", "4200", "5432"]
  }

  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH, HTTP app, and other custom ports"
}

