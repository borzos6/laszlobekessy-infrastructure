# ==================================== #
# laszlo.bekessy.me
# ==================================== 
output "laszlo_bekessy_me_cloudfront_id" {
  value = aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.id
}
output "laszlo_bekessy_me_cloudfront_domain_name" {
  value = aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.domain_name
}
