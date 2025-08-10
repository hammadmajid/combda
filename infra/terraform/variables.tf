# Terraform variable definitions for Google Cloud infrastructure
# These variables allow customization of the deployment without modifying the main configuration

# Google Cloud Project Configuration
variable "project_id" {
  description = "The unique GCP project ID where all resources will be created"
  type        = string
  # No default - must be provided by user to ensure correct project targeting
}

variable "project_name" {
  description = "Name prefix used for all resource names to ensure uniqueness and organization"
  type        = string
  default     = "combda"
  
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$", var.project_name))
    error_message = "Project name must be lowercase, start with a letter, and contain only letters, numbers, and hyphens."
  }
}

# Geographic Configuration - Critical for Free Tier Eligibility
variable "region" {
  description = "GCP region where resources will be created. MUST be us-west1, us-central1, or us-east1 for free tier eligibility"
  type        = string
  default     = "us-central1"  # Iowa region - typically has good performance and free tier availability
  
  validation {
    condition     = contains(["us-west1", "us-central1", "us-east1"], var.region)
    error_message = "Region must be one of the free tier eligible regions: us-west1, us-central1, or us-east1."
  }
}

variable "zone" {
  description = "Specific GCP zone within the selected region for VM placement"
  type        = string
  default     = "us-central1-a"  # Zone A in Iowa region
  
  validation {
    condition = can(regex("^(us-west1|us-central1|us-east1)-[a-z]$", var.zone))
    error_message = "Zone must be in a free tier eligible region (us-west1, us-central1, or us-east1)."
  }
}

# SSH Access Configuration
variable "ssh_user" {
  description = "Username for SSH access to the server (will be created if doesn't exist)"
  type        = string
  default     = "combda"
  
  validation {
    condition     = can(regex("^[a-z][a-z0-9_-]{0,31}$", var.ssh_user))
    error_message = "SSH username must start with a letter and contain only lowercase letters, numbers, underscores, and hyphens."
  }
}

variable "ssh_public_key_path" {
  description = "Local filesystem path to SSH public key file for server access"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  
  # Note: Terraform will expand ~ to the user's home directory
  # This key will be installed on the server for passwordless SSH access
}