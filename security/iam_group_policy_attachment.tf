# -------------- Admin -------------- #
resource "aws_iam_group_policy_attachment" "admin_AdministratorAccess" {
  provider   = aws.us_east_1
  group      = "admin"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}