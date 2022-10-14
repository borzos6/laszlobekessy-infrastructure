# ==================================== #
# Security module
# ==================================== #
output "iam_access_keys" {
  value = [
    {
      name   = "${module.security.laszlobekessy_deploy_user_name}"
      key    = "${module.security.laszlobekessy_deploy_access_key}"
      secret = "${module.security.laszlobekessy_deploy_secret_key}"
    },
  ]
  description = "The Access keys and secrets for the IAM users"
}

# ==================================== #
# Cloudfront distributions
# ==================================== #
output "laszlo_bekessy_me_website_cloudfront_data" {
  value = [
    {
      instance = "laszlo.bekessy.me"
      id       = "${module.laszlo_bekessy_me.laszlo_bekessy_me_cloudfront_id}"
      domain   = "${module.laszlo_bekessy_me.laszlo_bekessy_me_cloudfront_domain_name}"
    },
  ]
  description = "The CloudFront distributions"
}
