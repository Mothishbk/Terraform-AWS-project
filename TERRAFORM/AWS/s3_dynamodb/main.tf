provider "aws"{
    region  =  "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "terraform-demo-eks-bucket-state"

  lifecycle{
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "example" {
  name         = "terraform-demo-eks-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }

 

  
}