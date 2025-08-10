# Terraform output values for Google Cloud infrastructure
# These outputs provide important information needed for server management and access

# Network and Access Information
output "instance_ip" {
  description = "The static external IP address assigned to the web server"
  value       = google_compute_address.static_ip.address
  # This IP address will remain the same even if the VM is restarted
  # Use this IP for DNS configuration and firewall rules
}

output "instance_name" {
  description = "The full name of the compute instance in Google Cloud"
  value       = google_compute_instance.web_server.name
  # Useful for gcloud commands and resource management
}

output "ssh_command" {
  description = "Ready-to-use SSH command for connecting to the server"
  value       = "ssh ${var.ssh_user}@${google_compute_address.static_ip.address}"
  # Copy and paste this command to connect to your server
  # Ensure your SSH private key is loaded in your SSH agent
}

output "website_url" {
  description = "Direct URL to access the deployed website"
  value       = "http://${google_compute_address.static_ip.address}"
  # Initial HTTP URL - will be upgraded to HTTPS once SSL is configured via Ansible
  # Use this URL to verify your website is accessible after deployment
}

output "instance_zone" {
  description = "The specific Google Cloud zone where the instance is running"
  value       = google_compute_instance.web_server.zone
  # Needed for zone-specific gcloud commands and resource management
}

# Additional outputs for operational use
output "vpc_network_name" {
  description = "Name of the VPC network created for the infrastructure"
  value       = google_compute_network.vpc_network.name
  # Useful for network troubleshooting and additional resource creation
}

output "subnet_name" {
  description = "Name of the subnet where the instance is located"
  value       = google_compute_subnetwork.subnet.name
  # Helpful for network configuration and additional VM creation
}

output "ansible_inventory" {
  description = "Ansible inventory entry for the created server"
  value = "${google_compute_instance.web_server.name} ansible_host=${google_compute_address.static_ip.address} ansible_user=${var.ssh_user}"
  # Use this to create an Ansible inventory file for automated configuration
}