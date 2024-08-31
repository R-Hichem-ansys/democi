resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "my-fullstack-app"
  region = var.region
  size   = "s-1vcpu-1gb" # Choose the appropriate size for your app
  ssh_keys = [var.ssh_fingerprint]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              curl -L get.docker.com | bash
              sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
              curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
              curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
              sudo apt update
              sudo apt install -y caddy
              # Configure Caddy
              echo "bWltaWRlbW8uZHVja2Rucy5vcmcKCnJldmVyc2VfcHJveHkgOjgwMDA=" | base64 -d > /etc/caddy/Caddyfile
              docker run -d -p 8000:8000 ${var.dockerhub_username}/my-fullstack-app:latest
              EOF
}