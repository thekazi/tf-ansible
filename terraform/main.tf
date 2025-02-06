provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx-server"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}

output "container_ip" {
  value = docker_container.nginx.ip_address
}
