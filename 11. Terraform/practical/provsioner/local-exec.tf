terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}   


resource "aws_instance" "my-instance" {

    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    
    provisioner "local-exec" {
      command = "echo ${self.private_ip} >> private_ip.txt"
    }

}