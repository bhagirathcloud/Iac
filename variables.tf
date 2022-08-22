variable "linux_ami_id" {
    description = "ami id of the linux machine"
    default = "ami-052efd3df9dad4825"
}
variable "ssh_key" {
    description = "user ssh public key"
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCIVnbG9quGDQOkDDe1GdGhR7QI+sqf7+tpI1h1zq+xS4ZMQ1DeEkQVSXgmHYDjGPvinbapRU1987LDqKHdW+hcN6SqZ1i2C9t+R8tk/WIr5RejAcX2rqRoqqPIRAJUftcbGtJgTvoRVTgapemP4UCia3DGPCW1xp6B6/Gd5+HRF4rHr1C5vR6lSuo92uPreqd6fpN3jvq9n36Fdv3nmyu+6WmEmGYIIqSesI/7w+m/bOPIegoE2GZ/mAPCCDYUzp1r/C9R+JKzFZXLhCSxZsBWk+KSFmparlRdJW00UBYx+Ez57tcE9xiUv3y5hF55v9N572OugYBVOjurt0B1jTcp devops-training"
}
variable "vpc_id" {
    description = "vpc_id under which the resource group will create"
    default = "vpc-082485d83a32d7336"
}
variable "subnet" {
    description = "subnet id of the vpc"
    default = "	subnet-0b09b80c31a47edbf"
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
