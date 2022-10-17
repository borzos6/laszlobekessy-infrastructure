# ==================================== #
# Mailing
# ==================================== #
resource "aws_route53_record" "bekessy_me_mx_record" {
  provider = aws.us_east_1
  name     = "bekessy.me"
  records  = ["10 mxb.eu.mailgun.org", "10 mxa.eu.mailgun.org"]
  ttl      = 300
  type     = "MX"
  zone_id  = aws_route53_zone.bekessy_me_zone.zone_id
}

resource "aws_route53_record" "email_bekessy_me_cname_record" {
  provider = aws.us_east_1
  name     = "email.bekessy.me"
  records  = ["eu.mailgun.org"]
  ttl      = 300
  type     = "CNAME"
  zone_id  = aws_route53_zone.bekessy_me_zone.zone_id
}

resource "aws_route53_record" "mta__domainkey_bekessy_me_txt_record" {
  provider = aws.us_east_1
  name     = "mta._domainkey.bekessy.me"
  records  = ["k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn1k5ZwfO7DbouwKDyHUfoxUnoj/5zP7u2AzVqJE+Epod/hk29oa+NG9ymcjf/05MwVtjJgIk30odVFv194iVhRKyrrfFMMgM5bSlZqgrE9+vvdALaJAp\"\"MK/pLRffk/ZTPD0jUbgMaZx1hEEV5NC0XitRY20ynUmIpTcgON5ZN4PehyC/KdSv6WLMiU6QvY7LzbIytXT0FTZOiZmTporRheXGg6wDxJD3ywv4YdVDIE8hhnil7r4D0EomCvBccyreJJrYnj/I7kImtcIOnQn0i2nIndxoXJ3PDPIbffsQVAcMRyCnAuQK7Gi5gW5epOrSBRzWl3aOwgyzUCoBVFdr5QIDAQAB"]
  ttl      = 300
  type     = "TXT"
  zone_id  = aws_route53_zone.bekessy_me_zone.zone_id
}

# ==================================== #
# Mixed
# ==================================== #
resource "aws_route53_record" "bekessy_me_txt_record" {
  provider = aws.us_east_1
  name     = "bekessy.me"
  records = [
    "google-site-verification=pijNi4OyFxn6ej6uSvYNMoDnBKmWUx8ITSGdekI0B4s",
    "v=spf1 include:mailgun.org ~all"
  ]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.bekessy_me_zone.zone_id
}
