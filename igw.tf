resource "aws_internet_gateway" "coodesh_igw" {
  vpc_id = aws_vpc.coodesh_vpc.id
  tags = {
    Name = "coodesh_igw"
  }
}

resource "aws_route_table" "rota-publica" {
  vpc_id = aws_vpc.coodesh_vpc.id

  route {
    gateway_id = aws_internet_gateway.coodesh_igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "rota-publica"
  }
}