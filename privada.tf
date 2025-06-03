resource "aws_subnet" "coodesh_privada_a" {
  vpc_id            = aws_vpc.coodesh_vpc.id
  cidr_block        = var.cidr_block_privada-app-A
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "coodesh_privada_a"
  }
  
}

resource "aws_subnet" "coodesh_privada_b" {
  vpc_id            = aws_vpc.coodesh_vpc.id
  cidr_block        = var.cidr_block_privada-app-B
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "coodesh_privada_b"
  }
  
}

resource "aws_route_table_association" "rota-privada-a" {
  subnet_id      = aws_subnet.coodesh_privada_a.id
  route_table_id = aws_route_table.rota-publica.id
  
}

resource "aws_route_table_association" "rota-privada-b" {
  subnet_id      = aws_subnet.coodesh_privada_b.id
  route_table_id = aws_route_table.rota-publica.id
  
}