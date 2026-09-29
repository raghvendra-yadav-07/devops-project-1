resource "aws_dynamodb_table" "backend_table" {
    name = "my-terraform-backend-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute{
        name = "LockID"
        type = "S"
    }
  
  tags = {
    Name        = "My Terraform Backend Table"
    Environment = "Dev"
  }
}