# Terraform configuration for Google Cloud Free Tier deployment
# This creates a complete infrastructure setup for hosting a static Astro site
# on Google Cloud's always-free e2-micro VM instance

terraform {
  # Require Terraform version 1.0 or newer for stability and modern features
  required_version = ">= 1.0"
  
  # Specify required providers and their versions
  required_providers {
    google = {
      source  = "hashicorp/google"  # Official Google Cloud provider
      version = "~> 5.0"            # Use version 5.x (latest stable)
    }
  }
}

# Configure the Google Cloud provider with project and location settings
provider "google" {
  project = var.project_id  # GCP project ID where resources will be created
  region  = var.region      # Default region for regional resources
  zone    = var.zone        # Default zone for zonal resources (like VM instances)
}

# Create a custom VPC network for better security and network isolation
# This replaces the default network with our own controlled environment
resource "google_compute_network" "vpc_network" {
  name                    = "${var.project_name}-vpc"
  auto_create_subnetworks = false  # Disable auto-creation for manual subnet control
}

# Create a subnet within our VPC for the VM instance
# This defines the IP address range and region for our network segment
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_name}-subnet"
  ip_cidr_range = "10.0.1.0/24"                        # Private IP range (254 usable IPs)
  region        = var.region                            # Must match the region where VM will be created
  network       = google_compute_network.vpc_network.id # Associate with our custom VPC
}

# Firewall rule to allow HTTP and HTTPS traffic to web servers
# This enables public access to our website on standard web ports
resource "google_compute_firewall" "allow_http" {
  name    = "${var.project_name}-allow-http"
  network = google_compute_network.vpc_network.name

  # Allow incoming TCP traffic on web ports
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]  # HTTP and HTTPS ports
  }

  source_ranges = ["0.0.0.0/0"]    # Allow traffic from anywhere on the internet
  target_tags   = ["web-server"]   # Only apply to instances with this network tag
}

# Firewall rule to allow SSH access for server management
# This enables remote terminal access for administration and deployment
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.project_name}-allow-ssh"
  network = google_compute_network.vpc_network.name

  # Allow incoming TCP traffic on SSH port
  allow {
    protocol = "tcp"
    ports    = ["22"]  # Standard SSH port
  }

  source_ranges = ["0.0.0.0/0"]    # Allow SSH from anywhere (consider restricting in production)
  target_tags   = ["web-server"]   # Only apply to instances with this network tag
}

# Reserve a static external IP address for consistent access
# This ensures our website IP doesn't change when the VM restarts
resource "google_compute_address" "static_ip" {
  name   = "${var.project_name}-static-ip"
  region = var.region  # Regional resource, must match VM region
}

# Create the main compute instance (virtual machine) for hosting our website
# This is configured as an e2-micro instance to qualify for Google Cloud's Always Free tier
resource "google_compute_instance" "web_server" {
  name         = "${var.project_name}-vm"
  machine_type = "e2-micro"  # Free tier eligible: 0.25-1 vCPU, 1GB RAM
  zone         = var.zone    # Specific zone within the region

  # Network tags for firewall rule targeting
  tags = ["web-server"]

  # Configure the boot disk (operating system)
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"  # Ubuntu 22.04 LTS for stability
      size  = 10                                  # 10GB disk (free tier allows up to 30GB)
      type  = "pd-standard"                       # Standard persistent disk (cheapest option)
    }
  }

  # Configure network interface and assign our static IP
  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
    
    # External IP configuration for internet access
    access_config {
      nat_ip = google_compute_address.static_ip.address  # Use our reserved static IP
    }
  }

  # Instance metadata for configuration and access
  metadata = {
    # SSH key for secure access (no startup script - using Ansible instead)
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }

  # Service account configuration for Google Cloud API access
  service_account {
    scopes = ["cloud-platform"]  # Full access to Google Cloud APIs (adjust as needed)
  }

  # Lifecycle management to prevent accidental data loss
  lifecycle {
    create_before_destroy = true  # Create new instance before destroying old one during updates
  }
}

# Set project-wide SSH keys as a backup access method
# This ensures SSH access even if instance-specific keys fail
resource "google_compute_project_metadata" "ssh_keys" {
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }
}