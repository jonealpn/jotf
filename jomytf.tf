terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "mytfinstance" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2" 
  instance_type = "t2.micro"

  tags = {
    Name = "tfServerInstance"
  }
  metadata_options {
    http_tokens = "required"
  }
}