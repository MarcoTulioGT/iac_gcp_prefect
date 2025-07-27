resource "local_file" "ansible_inventory" {
  content  = <<-EOT
    [postgresql]
    vm-postgresql ansible_host=${google_compute_instance.postgresql_instance.network_interface[0].access_config[0].nat_ip} ansible_user=debian ansible_ssh_private_key_file=~/.ssh/id_rsa
  EOT
  filename = "${var.path_ansible}/inventory.ini"
}