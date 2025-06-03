resource "aws_subnet" "coodesh_publica_a" {
  vpc_id            = aws_vpc.coodesh_vpc.id
  cidr_block        = var.cidr_block_publica-A
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "coodesh_publica_a"
  }
  
}

resource "aws_subnet" "coodesh_publica_b" {
  vpc_id            = aws_vpc.coodesh_vpc.id
  cidr_block        = var.cidr_block_publica-B
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "coodesh_publica_b"
  }
  
}

resource "aws_route_table_association" "rota-publica-a" {
  subnet_id      = aws_subnet.coodesh_publica_a.id
  route_table_id = aws_route_table.rota-publica.id
  
}

resource "aws_route_table_association" "rota-publica-b" {
  subnet_id      = aws_subnet.coodesh_publica_b.id
  route_table_id = aws_route_table.rota-publica.id
  
}