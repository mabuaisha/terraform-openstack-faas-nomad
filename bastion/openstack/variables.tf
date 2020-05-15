variable "external_network_name" {}

variable "public_key" {
  default = "~/.ssh/faas_ssh.pub"
}

variable "private_key" {
  default = "~/.ssh/faas_ssh"
}

variable "env_name" {
  default = "serverless-env"
}

variable "allowed_cidr" {
  description = "A CIDR range of IP addresses which are allowed to SSH to the bastion host."
  default     = "0.0.0.0/0"
}

variable "flavor" {
  //default = "v2-highcpu-1"
  default = "s1-2"
}

variable "image" {
  //default = "CentOS 7.5.1804 (x86_64) [2018-06-06]"
  default = "Centos 7"
}

variable "subnet_cidr" {
  default = "192.168.0.0/24"
}

variable "dns_nameservers" {
  description = "An array of DNS name server names used by hosts in this subnet."
  type        = "list"
  default     = ["8.8.8.8", "8.8.4.4"]
}