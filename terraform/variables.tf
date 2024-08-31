variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "fra1"
}

variable "dockerhub_username" {
  description = "Your DockerHub username"
  type        = string
}

variable "ssh_fingerprint" {
  description = "SSH key fingerprint for accessing the droplet"
  type        = string
}
