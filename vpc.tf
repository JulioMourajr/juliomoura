resource "aws_vpc" "coodesh_vpc" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "coodesh_vpc"
    Environment = "dev"
  }
}