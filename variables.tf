#VPC
variable "vpc_cidr" {
    description = "The CIDR of my VPC"
    type = string
}

variable "vpc_name" {
  description = "The Name of My VPC"
  type = string
}
variable "internet_gw_name" {
  description = "The Name of My Internet Gateway"
  type = string
}
#PUBLIC SUBNETS
variable "public_a_cidr" {
    description = "CIDR of Public Subnet a"
    type = string
}

variable "public_b_cidr" {
    description = "CIDR of Public Subnet b"
    type = string
}
variable "public_c_cidr" {
    description = "CIDR of Public Subnet c"
    type = string
}
#PRIVATE SUBNETS
variable "private_a_cidr" {
    description = "CIDR of Private Subnet a"
    type = string
}
variable "private_b_cidr" {
    description = "CIDR of Private Subnet b"
    type = string
}
variable "private_c_cidr" {
    description = "CIDR of Private Subnet c"
    type = string
}
#REGION
variable "region" {
    description = "Default Region for our VPC"
    type = string
}


#Instance
variable "instance_type" {
    description = "They type of my first server"
    type = string
}

variable "keypair_name" {
    description = "Name of key pair"
    type = string 
}