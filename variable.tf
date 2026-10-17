variable "region" {
  description = "region to deploy"
  type = string
  default = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_01" {
  description = "public subnet 01"
  type = string
  default = "10.0.0.0/24"
}
variable "public_subnet_02" {
  description = "public subnet 01"
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_01" {
  description = "public subnet 01"
  type = string
  default = "10.0.2.0/24"
}
variable "private_subnet_02" {
  description = "public subnet 01"
  type = string
  default = "10.0.3.0/24"
}


variable "environment" {
  description = "environment"
  type = string
  default = "staging"
}

variable "Owner" {
  description = "owner"
  default = "Engr Smart"
}

variable "instance_type" {
  description = "type of instance"
  default = "t2.small"
}

variable "worker-count" {
  description = "number of worker nodes"
  default = 2
  
}