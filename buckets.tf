resource "aws_s3_bucket" "priya5620261" {
bucket = "priya5620261"
depends_on = [aws_s3_bucket.priya5720262]
}

resource "aws_s3_bucket" "priya5720262" {
bucket = "priya5720262"
depends_on = [aws_s3_bucket.priya5820263]
}

resource "aws_s3_bucket" "priya5820263" {
bucket = "priya5820263"
}