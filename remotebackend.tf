terraform {
  backend "s3" {
    bucket         = "priya582026"
    key            = "dev/dev.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformlocks"
    encrypt        = true
  }
}

resource "aws_dynamodb_table" "terraform_locking" {
name = "terraformlocks"
billing_mode = "PAY_PER_REQUEST"
hash_key = "LockID"
attribute {
name = "LockID"
type = "S"
}
}