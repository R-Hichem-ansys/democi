resource "digitalocean_droplet" "web" {
  image  = "docker-20-04"
  name   = "my-fullstack-app"
  region = var.region
  size   = "s-1vcpu-1gb" # Choose the appropriate size for your app
  ssh_keys = [var.ssh_fingerprint]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y debian-archive-keyring

              # Install Caddy
              curl -fsSL https://getcaddy.com | bash -s personal
              apt-get install -y caddy

              # Configure Caddy
              cat <<EOF > /etc/caddy/Caddyfile
              your-domain.com {
                  reverse_proxy / http://localhost:8000
              }
              systemctl enable caddy
              systemctl start caddy
              docker pull ${var.dockerhub_username}/my-fullstack-app:latest
              docker run -d -p 8000:8000 ${var.dockerhub_username}/my-fullstack-app:latest
              EOF
}