resource "aws_iam_user" "admins_count" {
  count = length(var.users)
  name  = element(var.users, count.index)
  tags = {
    tag-key = element(var.users, count.index)
  }
}