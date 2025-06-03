resource "aws_eip" "coodesh_eip_a" {

  associate_with_private_ip = true

  tags = {
    Name = "coodesh_eip_a"
  }
  
}

resource "aws_eip" "coodesh_eip_b" {

  associate_with_private_ip = true

  tags = {
    Name = "coodesh_eip_b"
  }
  
}

resource "aws_nat_gateway" "coodesh_nat_a" {
  allocation_id = aws_eip.coodesh_eip_a.id
  subnet_id     = aws_subnet.coodesh_publica_a.id

  tags = {
    Name = "coodesh_nat_a"
  }
}

resource "aws_nat_gateway" "coodesh_nat_b" {
  allocation_id = aws_eip.coodesh_eip_b.id
  subnet_id     = aws_subnet.coodesh_publica_b.id

  tags = {
    Name = "coodesh_nat_b"
  }
}

resource "aws_route_table" "rota-privada-A" {
  vpc_id = aws_vpc.coodesh_vpc.id

  route {
    nat_gateway_id = aws_nat_gateway.coodesh_nat_a.id
    cidr_block     = "0.0.0/0"
 }
    tags = {
      Name = "rota-privada-A"
    }
}

resource "aws_route_table" "rota-privada-B" {
  vpc_id = aws_vpc.coodesh_vpc.id

  route {
    nat_gateway_id = aws_nat_gateway.coodesh_nat_b.id
    cidr_block     = "0.0.0/0"
 }
    tags = {
      Name = "rota-privada-B"
    }
}

