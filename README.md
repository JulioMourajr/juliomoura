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

[Diagrama](./Diagrama.png)

## CI/CD Pipeline com GitLab CI

Configuração de um pipeline CI/CD usando GitLab CI para construir e implantar uma aplicação wordpress em uma EC2 na AWS.

Primeiro passo é criar o arquivo .gitlab-ci.yml na raiz do projeto.

stages:
  - validate
  - plan
  - apply
  - deploy

variables:
  TF_ROOT: "."

before_script:
  - apk add --no-cache curl unzip
  - curl -o terraform.zip https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_amd64.zip
  - unzip terraform.zip && mv terraform /usr/local/bin/ && terraform version

validate:
  stage: validate
  script:
    - cd $TF_ROOT
    - terraform init -input=false
    - terraform validate

plan:
  stage: plan
  script:
    - cd $TF_ROOT
    - terraform plan -out=tfplan

apply:
  stage: apply
  script:
    - cd $TF_ROOT
    - terraform apply -auto-approve tfplan
  when: manual

2. Lembrar de também configurar as variáveis de ambiente no GitLab
No GitLab, vá em Settings > CI/CD > Variables e adicione:

todo git push vem antes o git pull

asas

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION (ex: us-east-1)
Essas variáveis serão usadas pelo Terraform para autenticar na AWS.

eu tenho que adicionar uma linha para gerar conflito.




