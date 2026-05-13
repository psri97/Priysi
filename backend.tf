terraform {
  backend "s3" {
    bucket         = "priya5122026"
    key            = "dev"
    region         = "us-east-1"
  }
}