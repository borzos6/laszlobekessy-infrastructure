# ==================================== #
# bekessy.me Zone, NS & SOA & CAA
# ==================================== #
resource "aws_route53_zone" "bekessy_me_zone" {
  provider      = aws.us_east_1
  name          = "bekessy.me"
  comment       = "bekessy.me"
  force_destroy = false
}

resource "aws_route53_record" "bekessy_me_ns_record" {
  provider        = aws.us_east_1
  name            = "bekessy.me"
  type            = "NS"
  ttl             = 172800
  allow_overwrite = true
  zone_id         = aws_route53_zone.bekessy_me_zone.zone_id

  records = [
    "${aws_route53_zone.bekessy_me_zone.name_servers[0]}.",
    "${aws_route53_zone.bekessy_me_zone.name_servers[1]}.",
    "${aws_route53_zone.bekessy_me_zone.name_servers[2]}.",
    "${aws_route53_zone.bekessy_me_zone.name_servers[3]}.",
  ]
}

resource "aws_route53_record" "bekessy_me_soa_record" {
  provider = aws.us_east_1
  name     = "bekessy.me"
  type     = "SOA"
  ttl      = 900
  zone_id  = aws_route53_zone.bekessy_me_zone.zone_id
  records  = ["${aws_route53_zone.bekessy_me_zone.name_servers[3]}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
}

resource "aws_route53_record" "bekessy_me_caa_record" {
  provider = aws.us_east_1
  zone_id  = aws_route53_zone.bekessy_me_zone.zone_id
  name     = "bekessy.me"
  type     = "CAA"
  ttl      = "300"

  records = [
    "0 issuewild \"amazon.com\"",
    "0 issuewild \"amazontrust.com\"",
    "0 issuewild \"awstrust.com\"",
    "0 issuewild \"amazonaws.com\""
  ]
}
