### Infra Challenge da Coodesh

Para instruções detalhadas do README original [READMEOriginal.md](./READMEOriginal.md).

## Minha Solução

Este projeto foi desenvolvido com o objetivo de criar uma infraestrutura robusta e escalável na AWS, garantindo alta disponibilidade para o servidor nginx. 

Escolhi colocar VPC (Virtual Private Cloud) que é uma rede virtual isolada onde todos os recursos são provisionados, garantindo segurança e controle de tráfego. 4 subnets, duas publicas e duas privadas para a aplicação ter alta disponibilidade e resiliência, com o Elastic Load Balancer (ELB) que distribui o tráfego de entrada entre várias instâncias EC2, assegurando balanceamento de carga e redundância.

Terraform para provisionar o ambiente, evitando assim erros manuais.

## Pré-requisitos

- Instale o [Terraform](https://www.terraform.io/downloads.html) v1.10.5 ou superior
- Conta AWS com permissões adequadas
- Chave SSH para acesso às instâncias EC2

## Crie o arquivo main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

. Inicialize o Terraform:
    ```
    terraform init
    ```

## Configuração

1. Crie um arquivo `terraform.tfvars` com as variáveis necessárias:
    ```ini
    aws_access_key = "sua_chave_de_acesso"
    aws_secret_key = "sua_chave_secreta"
    region         = "us-east-1"
    ```
2. Ajuste as variáveis no arquivo [variables.tf](https://medium.com/@habbema/terraform-variables-e2f46ebe3f32) conforme necessário.

## Criaçção do arquivos .tf

# Criar o arquivo que vai configurar a VPC

[vpc.tf](./vpc.tf)

# Configurar grupo de segurança na AWS

[sg.tf](./sg.tf)

# configurar as subnets publicas e privadas

[subnet publica](./publica.tf)

[subnet privada](./privada.tf)

# configurar internet gateway

[Internet Gateway](./igw.tf)

# Configurar Nategateway

[Natgateway](./ngw.tf)

# Configurar Application Load Balancer

[Load Balancer](./alb.tf)



