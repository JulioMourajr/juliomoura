#!/bin/bash

# Esse script instala o Nginx e configura um servidor web básico.

sudo yum update -y

sudo yum install -y nginx

sudo systemctl start nginx

sudo systemctl enable nginx

cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem-vindo ao meu servidor Nginx</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head> 

<body>
    <h1>Bem-vindo ao meu servidor Nginx</h1>
    <p>Este é um servidor web básico configurado com Nginx.</p>
    <p>Você pode acessar a documentação do Nginx <a href="https://nginx.org/en/docs/">aqui</a>.</p>
    <p>Para mais informações, visite o <a href="https://www.nginx.com/">site oficial do Nginx</a>.</p>
    <p>Obrigado por visitar!</p>
</body>
</html>
EOF

sudo systemctl restart nginx






