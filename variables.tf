variable "linux_ami_id" {
    description = "ami id of the linux machine"
    default = "ami-0598022403848c051"
}
variable "ssh_key" {
    description = "user ssh public key"
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZFuuu7wQCfVl3kHpnLPFfYTaSQ74IhEYV+Q2LXee6s0jtJsAo6BlZ7GUkPm6qa7Z+O2jXphe8VQsB5btMxv1Us5xS+AyIlPWFC1pRAsoJULmg8Tc7s97+l6BPzVwfDhFqIZkZpRnY7KYb438+/wA9ahdfeYb1BiptN/VUfGz12gmJhppDh5/MyyXUhwUrmLDSnsxr+VyLTfeffMhz2KXGF3UR3mjgPklIMpwMQJPoM6rEUJ4zpz+cVJLBRAQT0QXZMvjd+eNxg6bgWlnHYvK/1KdQDY6q/KaKMKJqHVNYRMpRgcBnfyHhiPP5ePzcB1aQgHJl9uwyTkwjcukvJZw7 cicd"
}
variable "vpc_id" {
    description = "vpc_id under which the resource group will create"
    default = "vpc-06d9c1d3ecf203e11"
}
variable "subnet" {
    description = "subnet id of the vpc"
    default = "	subnet-0c1622b82b3c369e3"
}
variable "cidr_blocks" {
    description = "subnet ip range in cidr block"
    default = ["0.0.0.0/0"]
}

variable "region" {
    description = "aws region"
    default = "us-east-1"
}
variable "volume_type" {
    description = "type of the storage"
    default = "gp2"
}
