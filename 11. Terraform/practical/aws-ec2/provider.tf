terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
  backend "s3" {
   bucket = "terra-guvi-state-backend"
   key = "terraform.tfstate"
   region = "ap-south-1"
   dynamodb_table = "statefile-guvi-table"
 } 

}


provider "aws" {
  region = var.region
}   
