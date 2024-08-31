resource "digitalocean_droplet" "web" {
  image  = "docker-20-04"
  name   = "my-fullstack-app"
  region = var.region
  size   = "s-1vcpu-1gb" # Choose the appropriate size for your app
  ssh_keys = [var.ssh_fingerprint]

  user_data = <<-EOF
              #!/bin/bash
              docker run -d -p 80:8000 ${var.dockerhub_username}/my-fullstack-app:latest
              EOF
}