module "swarm-cluster" {
  source = "../../modules/docker-swarm/openstack"
  env_name = var.env_name
  worker_name = var.worker_name
  bastion_ip = var.bastion_ip
  server_image = var.image
  server_flavor = var.flavor
  private_key = var.private_key
  network_id = var.network_id
  docker_password = var.docker_password
  docker_username = var.docker_username
  manager_count = var.manager_count
  worker_count = var.worker_count
  security_group_ids = ["default"]
}
