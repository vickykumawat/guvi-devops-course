resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "statefile-guvi-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "statefile-guvi-table"
  }
}