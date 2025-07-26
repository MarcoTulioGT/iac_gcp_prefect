output "firewall_name" {
  description = "Nombre de la regla de firewall"
  value       = google_compute_firewall.allow_prefect_ports.name
}

output "allowed_ports" {
  description = "Puertos permitidos por la regla"
  value       = [for rule in google_compute_firewall.allow_prefect_ports.allow : rule.ports]
}

output "network_used" {
  description = "Red asociada a la regla de firewall"
  value       = google_compute_firewall.allow_prefect_ports.network
}