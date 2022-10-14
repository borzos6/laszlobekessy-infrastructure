resource "aws_iam_user_policy_attachment" "aws_human_user_change_password" {
  for_each = local.laszlobekessy_human_users

  provider   = aws.eu_central_1
  user       = each.value
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "aws_human_user_s3_console_generic_access" {
  for_each = local.laszlobekessy_human_users

  provider   = aws.eu_central_1
  user       = each.value
  policy_arn = aws_iam_policy.s3_console_generic_access.arn
}
