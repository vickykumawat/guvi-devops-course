variable "InstanceType" {
    default = "t2.micro"
    type = string
  
}

variable "region" {
    default = "ap-south-1"
    type = string
    description = "THis is the region for my infra"
  
}
