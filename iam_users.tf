# resource "aws_iam_user" "admins_count" {
#   count = length(var.users)
#   name  = element(var.users, count.index)
#   tags = {
#     tag-key = element(var.users, count.index)
#   }
# }

resource "aws_iam_user" "admins_for_each" {
  for_each = toset(var.users1)
  name     = each.value
  tags = {
    tag-key = each.value
  }
}