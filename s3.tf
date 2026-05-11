resource "aws_s3_bucket" "bucket1" {
  bucket = "testbucket20265110001"

  tags = {
    Name        = "testbucket20265110001"
    Environment = "Dev"
  }
    lifecycle {
      create_before_destroy = true
    }
}