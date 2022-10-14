# laszlobekessy-deploy
output "laszlobekessy_deploy_user_name" {
  value = aws_iam_user.laszlobekessy_deploy.name
}
output "laszlobekessy_deploy_access_key" {
  value = aws_iam_access_key.laszlobekessy_deploy_access_key.id
}
output "laszlobekessy_deploy_secret_key" {
  value = aws_iam_access_key.laszlobekessy_deploy_access_key.encrypted_secret
}

# laszlobekessy-human_users
output "laszlobekessy_human_users" {
  value = local.laszlobekessy_human_users
}
