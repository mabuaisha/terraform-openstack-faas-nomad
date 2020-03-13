module "network" {
  source = "../modules/network"
  env_name = var.env_name
  external_network_name = var.external_network_name
  subnet_cidr = var.subnet_cidr
  dns_nameservers = var.dns_nameservers
}

module "bastion" {
  source = "../modules/bastion"
  env_name = var.env_name
  image = var.image
  flavor = var.flavor
  external_network_name = var.external_network_name
  public_key = var.public_key
  private_key = var.private_key
  network_id = module.network.network_id
}

module "swarm-cluster" {
  source = "../modules/docker-swarm"
  env_name = var.env_name
  worker_name = var.worker_name
  bastion_ip = module.bastion.bastion-instance-floating-ip
  server_image = var.image
  server_flavor = var.flavor
  private_key = var.private_key
  network_id = module.network.network_id
  docker_password = var.docker_password
  docker_username = var.docker_username
  security_group_ids = [openstack_compute_secgroup_v2.general_sg.name, "default"]
}
