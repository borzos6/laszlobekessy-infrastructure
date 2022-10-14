resource "aws_iam_group" "admin" {
  provider = aws.us_east_1
  name     = "admin"
  path     = "/"
}
