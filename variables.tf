variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "seu Profile"
}

variable "cidr_block_vpc" {
  default = "10.0.0.0/16"
}

variable "cidr_block_publica-A" {
  default = "10.0.1.0/24"
}


variable "cidr_block_publica-B" {
  default = "10.0.2.0/24"
}

variable "cidr_block_privada-app-A" {
  default = "10.0.3.0/24"
}

variable "cidr_block_privada-app-B" {
  default = "10.0.4.0/24"
}