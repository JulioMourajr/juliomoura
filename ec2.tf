resource "aws_instance" "nginx-instance-1a" {
    ami           = "ami-0c614dee691cbbf37" # Ou coloque a AMI que você deseja usar
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.coodesh_publica_a.id
    security_groups = [aws_security_group.nginx_sg.name]

    user_data = base64encode(templatefile("${path.module}/nginx.sh", {
        server_name = "nginx-instance-1a"
    }))
    
    tags = {
        Name = "nginx-instance-1a"
    }
  
}

resource "aws_instance" "nginx-instance-1b" {
    ami           = "ami-0c614dee691cbbf37" # Ou coloque a AMI que você deseja usar
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.coodesh_publica_b.id
    security_groups = [aws_security_group.nginx_sg.name]

    user_data = base64encode(templatefile("${path.module}/nginx.sh", {
        server_name = "nginx-instance-1b"
    }))
    
    tags = {
        Name = "nginx-instance-1b"
    }
  
}