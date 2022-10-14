# ==================================== #
# ROUTING RESOURCES
# ==================================== #
data "aws_route53_zone" "bekessy_me_zone" {
  provider = aws.us_east_1
  name     = "bekessy.me"
}

data "aws_acm_certificate" "bekessy_me_us_east_1" {
  provider    = aws.us_east_1
  domain      = "bekessy.me"
  statuses    = ["ISSUED"]
  most_recent = true
}

# ==================================== #
# LOGGING RESOURCES
# ==================================== #
data "aws_s3_bucket" "laszlobekessy_cloudfront_logs" {
  provider = aws.eu_central_1
  bucket   = "laszlobekessy-cloudfront-logs"
}

# ==================================== #
# SECURITY RESOURCES
# ==================================== #
data "aws_caller_identity" "current" {
  provider = aws.us_east_1
}

data "aws_canonical_user_id" "current_user" {
  provider = aws.us_east_1
}

data "aws_iam_user" "laszlobekessy_deploy" {
  provider  = aws.us_east_1
  user_name = "laszlobekessy-deploy"
}
