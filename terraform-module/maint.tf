module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-04505e74c0741db8d"
  key_name               = "ssh-testing"
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = ["sg-065677c0ee9a85618"]
  subnet_id              = "subnet-0c1622b82b3c369e3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "ssh-testing"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZFuuu7wQCfVl3kHpnLPFfYTaSQ74IhEYV+Q2LXee6s0jtJsAo6BlZ7GUkPm6qa7Z+O2jXphe8VQsB5btMxv1Us5xS+AyIlPWFC1pRAsoJULmg8Tc7s97+l6BPzVwfDhFqIZkZpRnY7KYb438+/wA9ahdfeYb1BiptN/VUfGz12gmJhppDh5/MyyXUhwUrmLDSnsxr+VyLTfeffMhz2KXGF3UR3mjgPklIMpwMQJPoM6rEUJ4zpz+cVJLBRAQT0QXZMvjd+eNxg6bgWlnHYvK/1KdQDY6q/KaKMKJqHVNYRMpRgcBnfyHhiPP5ePzcB1aQgHJl9uwyTkwjcukvJZw7 cicd"
}
