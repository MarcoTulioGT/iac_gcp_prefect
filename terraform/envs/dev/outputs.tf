output "postgresql_public_ip" {
  description = "IP pública de la instancia PostgreSQL (desde módulo)"
  value       = module.postgresql.postgresql_ip
}

output "prefect_public_ip" {
  description = "IP pública de la instancia Prefect (desde módulo)"
  value       = module.prefect.prefect_ip
}