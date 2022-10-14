# ==================================== #
# Certificates US-EAST-1
# ==================================== #
resource "aws_acm_certificate" "bekessy_me_us_east_1" {
  provider                  = aws.us_east_1
  domain_name               = "bekessy.me"
  subject_alternative_names = ["*.bekessy.me"]
  validation_method         = "DNS"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ==================================== #
# DNS validation Route53 records US-EAST-1
# ==================================== #
resource "aws_route53_record" "bekessy_me_us_east_1_certificate_dns_validation_route" {
  provider = aws.us_east_1

  for_each = {
    for dvo in aws_acm_certificate.bekessy_me_us_east_1.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.bekessy_me_zone.zone_id
}

# ==================================== #
# DNS validation objects US-EAST-1
# ==================================== #
resource "aws_acm_certificate_validation" "bekessy_me_us_east_1_certificate_dns_validation" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.bekessy_me_us_east_1.arn
  validation_record_fqdns = [for record in aws_route53_record.bekessy_me_us_east_1_certificate_dns_validation_route : record.fqdn]
}

# ============================================================================================================ #
# ==================================== #
# Certificates EU-CENTRAL-1
# ==================================== #
