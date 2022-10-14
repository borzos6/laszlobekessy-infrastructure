# ==================================== #
# Main A records
# ==================================== #
resource "aws_route53_record" "bekessy_me_a_record" {
  provider = aws.us_east_1
  name     = "bekessy.me"
  type     = "A"
  zone_id  = data.aws_route53_zone.bekessy_me_zone.zone_id

  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.hosted_zone_id
  }
}

resource "aws_route53_record" "laszlo_bekessy_me_a_record" {
  provider = aws.us_east_1
  name     = "laszlo.bekessy.me"
  type     = "A"
  zone_id  = data.aws_route53_zone.bekessy_me_zone.zone_id

  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.hosted_zone_id
  }
}
