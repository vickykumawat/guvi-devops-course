
resource "aws_instance" "myserver1" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = var.InstanceType

    tags = {
        Name = "MyServer1"
        Env   = "test"
    }
  
}

resource "aws_instance" "myserver2" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = var.InstanceType

    tags = {
        Name = "MyServer2"
    }
  
}


