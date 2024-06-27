#resource >>> to create brand new resources
#provider >>> plugins that you need and platforms you want to use
#data >>> to use existing resources in your platform and retrieve data about your resources
#variable >>> dynamic, not static, creating a certain key and assigning a value
#locals >>> similar to variables with slightly different purposes
#module >>>



provider "aws" {
  region = "us-east-1"
}

#Alias and Nicknames
locals {
  
}

#Inputs
variable "my_cidr_block" {
  default = "10.0.0.0/28"
}

resource "aws_vpc" "main_3" {
  cidr_block       = var.my_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}



resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main_3.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
  