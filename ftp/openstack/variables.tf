variable "external_network_name" {}
variable "network_id" {}
variable "ftp_username" {}
variable "ftp_password" {}

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
  default = "m1.medium"
}

variable "image" {
  default = "CentOS-7_6-x86_64-GenericCloud"
}
