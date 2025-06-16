terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }

 backend "s3" {
   bucket = "terraform--guvi-backend"
   key = "terraform.tfstate"
   region = "ap-south-1"
 }

}


provider "aws" {
  region = "ap-south-1"
}   


resource "random_id" "randon-number" {
  
  byte_length = 8
}

output "random_number" {
  value = random_id.randon-number.id
}


resource "aws_s3_bucket" "guvi-bucket1" {
  bucket = "terraform-guvi-bucket"
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "demo-bucket-${random_id.randon-number.hex}"
}
resource "aws_s3_bucket" "demo-bucket2" {
  bucket = "demo-bucket2-${random_id.randon-number.hex}"
}

resource "aws_s3_object" "my-file" {
  bucket =  aws_s3_bucket.guvi-bucket1.bucket
  source = "./myfile.txt"
  key = "mydata.txt"

}

resource "aws_s3_object" "my-file1" {
  bucket =  aws_s3_bucket.demo-bucket.bucket
  source = "./sample.txt"
  key = "sample.txt"

}