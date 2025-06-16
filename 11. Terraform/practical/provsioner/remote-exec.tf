resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = file("terra-ec2-key.pub")
}


resource "aws_instance" "remote-instance" {

    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    key_name = aws_key_pair.my-key.key_name
    vpc_security_group_ids = [ "sg-07b322cb0dfece5b5" ]
    
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("terra-ec2-key")
    host     = self.public_ip
   }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
    ]
  }

 
}