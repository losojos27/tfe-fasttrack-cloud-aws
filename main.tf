terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.51"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}


data "aws_ami" "amzLinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amzLinux.id
  instance_type = "t2.micro"
#  vpc_security_group_ids = 
#  subnet_id              = 

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
