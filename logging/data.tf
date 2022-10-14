# ==================================== #
# SECURITY RESOURCES
# ==================================== #
data "aws_caller_identity" "current" {}

data "aws_cloudfront_log_delivery_canonical_user_id" "cloudfront_user" {
  provider = aws.eu_central_1
}

data "aws_canonical_user_id" "current_user" {
  provider = aws.eu_central_1
}
