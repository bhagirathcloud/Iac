terraform {
    backend "s3" {
    bucket = "terraforminfracode"
    key    = "terraform_Iac.tfstate"
    region = "us-east-1"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

#module "aws_security_group" {
#  source      = "terraform-aws-modules/security-group/aws"
#  name = "k8s-cluster-sg"
#}

resource "aws_instance" "controller_linux" {
  ami                         = "${var.linux_ami_id}"
  instance_type               = "t2.large"
  associate_public_ip_address = true
  subnet_id = "${var.subnet}"
  key_name                    = "ssh-key"
  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = 60
    delete_on_termination = true
    encrypted = true
  }
  tags = {
    Name = "IaC-Infra"
  }
}

output "instance_ip_linux_controller" {
  description = "The public ip for ssh access to linux controller"
  value       = aws_instance.controller_linux.public_ip
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "${var.ssh_key}"
}


resource "aws_security_group" "k8s-cluster-sg" {
  name        = "k8s-cluster-sg"
  description = "Allow sall traffic"
  vpc_id      = "${var.vpc_id}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "${var.cidr_blocks}"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "${var.cidr_blocks}"
  }
  tags = {
    Name = "k8s-cluster-sg"
  }
}


output "securitygroup_id" {
  value = aws_security_group.k8s-cluster-sg.id
}

resource "aws_network_interface_sg_attachment" "controller_sg_attachment" {
  security_group_id    = aws_security_group.k8s-cluster-sg.id
  network_interface_id = aws_instance.controller_linux.primary_network_interface_id
}

