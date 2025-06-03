resource "aws_security_group" "nginx_sg" {
  vpc_id      = aws_vpc.coodesh_vpc.id
  description = "Security group for ngix."
  name        = "nginx_sg"

  ingress {
    description = "Allow HTTP do ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [ aws_security_group.alb_sg.id ]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [ aws_security_group.alb_sg.id ]
  }

  egress {
    description = "Allow all traffic out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx_sg"
  }

}

resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.coodesh_vpc.id
  description = "Security group para o Elastic LoadBalancer."
  name = "alb_sg"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    description = "Allow all traffic out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_sg"
  }
}