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



#create VPC

resource "aws_vpc" "guvi-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "guvi-vpc"
  }
}


#Private subnet
resource "aws_subnet" "PrivateSubnet" {
    vpc_id = aws_vpc.guvi-vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
      Name = "Private Subnet"
    }
  
}

#publlic Sebnet
resource "aws_subnet" "PublicSubnet" {
    vpc_id = aws_vpc.guvi-vpc.id
    cidr_block = "10.0.2.0/24"

    tags = {
      Name = "Public Subnet"
    }
  
}


#Internet gateway

resource "aws_internet_gateway" "guvi-igw" {
  vpc_id = aws_vpc.guvi-vpc.id

  tags = {
    Name = "guvi-igw"
  }
}

#Route table

resource "aws_route_table" "guvi-rt" {
  vpc_id = aws_vpc.guvi-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.guvi-igw.id
  }
}

resource "aws_route_table_association" "public-rt" {
  route_table_id = aws_route_table.guvi-rt.id
  subnet_id = aws_subnet.PublicSubnet.id
}


resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = file("terra-ec2-key.pub")
}


#security Group

resource "aws_security_group" "guvi-instance-sg" {
  name = "guvi-instance-sg"
  description = "This is the sg for my guvi instance"
  vpc_id = aws_vpc.guvi-vpc.id

  #inbound rule

  ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   description = "SSH open"

  }

  ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   description = "HTTP open"

  }

  #outbound rule
  egress {
  from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
   description = "all access"
  }
  tags = {
    Name = "Guvi-instance-SG"
  }

}


#Ec2 instance
resource "aws_instance" "my-instance" {

   # count = 2
    
    for_each = tomap({
    "Instance-1" = "t2.micro"
    "Instance-2" = "t2.medium"
    })

    ami = "ami-02521d90e7410d9f0"
    instance_type = each.value
    depends_on = [ aws_security_group.guvi-instance-sg,aws_key_pair.my-key ]
    subnet_id = aws_subnet.PublicSubnet.id
    vpc_security_group_ids = [aws_security_group.guvi-instance-sg.id]
    key_name = aws_key_pair.my-key.key_name
    associate_public_ip_address =true

    user_data = file("install-nginx.sh")

    root_block_device {
      volume_size = 10
      volume_type = "gp2"
    }

    tags = {
        Name = each.key
    }
  
}


# output "public_ip" {
#   value = aws_instance.instance-1[*].public_ip
  
# }

output "public_ip" {

  value = [
    for key in aws_instance.my-instance : key.public_ip
  ]
  
}