terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# resource "aws_instance" "udacity_t2" {
#   count         = 4
#   ami           = "ami-079db87dc4c10ac91"
#   instance_type = "t2.micro"
#   subnet_id     = "subnet-0c9158c390b890d1e"
#   tags = {
#     Name = "Udacity T2"
#   }
# }

# resource "aws_instance" "udacity_m4" {
#   count         = 2
#   ami           = "ami-079db87dc4c10ac91"
#   instance_type = "m4.large"
#   subnet_id     = "subnet-0c9158c390b890d1e"
#   tags = {
#     Name = "Udacity M4"
#   }
# }

resource "aws_instance" "udacity_t2" {
  count         = 4
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0c9158c390b890d1e"
  tags = {
    Name = "Udacity T2"
  }
}