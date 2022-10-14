data "local_file" "pgp_key" {
  filename = "pgp/public-key-binary.gpg"
}

# -------- laszlobekessy_deploy -------- #
resource "aws_iam_user" "laszlobekessy_deploy" {
  provider      = aws.us_east_1
  name          = "laszlobekessy-deploy"
  force_destroy = false
  path          = "/"
}

resource "aws_iam_access_key" "laszlobekessy_deploy_access_key" {
  provider = aws.us_east_1
  user     = aws_iam_user.laszlobekessy_deploy.name
  pgp_key  = data.local_file.pgp_key.content_base64
}

# -------- laszlobekessy_human_users -------- #
resource "aws_iam_user" "laszlobekessy_human_users" {
  for_each = local.laszlobekessy_human_users

  provider      = aws.us_east_1
  name          = each.value
  force_destroy = false
  path          = "/humans/"
}
