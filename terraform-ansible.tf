terraform {
    backend "s3" {
    bucket = "statefile-bhagi"
    key    = "terraform_Iac.tfstate"
    region = "us-east-1"
  }
}

terraform {

  required_version = ">= 0.12"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

#module "aws_security_group" {
#  source      = "terraform-aws-modules/security-group/aws"
#  name = "k8s-cluster-sg"
#}

resource "aws_instance" "controller_linux" {
  ami                         = var.linux_ami_id
  instance_type               = "t2.large"
  associate_public_ip_address = true
  subnet_id = var.subnet
  key_name                    = "september"
  vpc_security_group_ids      = ["sg-00489591914e0a9cb"]
  root_block_device {
    volume_type           = var.volume_type
    volume_size           = 60
    delete_on_termination = true
    encrypted = true
  }
  tags = {
    Name = "IaC-Infra"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install python3 -y",  # Example command
    ]
connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/ubuntu/september.pem")
    host        = self.public_ip
  }

  }
provisioner "local-exec" {
 command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip},' --private-key ${var.ssh_key_private} nginx-playbook.yml"
 }
}



output "instance_ip_linux_controller" {
  description = "The public ip for ssh access to linux controller"
  value       = aws_instance.controller_linux.public_ip
}

