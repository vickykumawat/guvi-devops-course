
output "myserver_public_ip" {
    value = aws_instance.myserver1.public_ip
  
}

output "myserver_public_dns" {
    value = aws_instance.myserver1.public_dns
  
}
output "myserver_ID" {
    value = aws_instance.myserver1.id
  
}
