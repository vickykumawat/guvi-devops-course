resource "aws_s3_bucket" "remote-backend" {
  bucket = "terra-guvi-state-backend"

  tags = {
    Name = "My state bucket"
  }
}