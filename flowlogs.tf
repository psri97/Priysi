resource "aws_flow_log" "Dev-flowlogs" {
  log_destination      = aws_s3_bucket.Devflow-logs.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.Dev-VPC.id
}

resource "aws_s3_bucket" "Devflow-logs" {
  bucket = "rajeshdevlogs592026"
}