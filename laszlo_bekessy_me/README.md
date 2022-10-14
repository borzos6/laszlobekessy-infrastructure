<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_aws.eu_central_1"></a> [aws.eu\_central\_1](#provider\_aws.eu\_central\_1) | ~> 4.0 |
| <a name="provider_aws.us_east_1"></a> [aws.us\_east\_1](#provider\_aws.us\_east\_1) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_iam_policy.laszlobekessy_cloudfront_invalidation_policy_laszlo_bekessy_me_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.laszlobekessy_deploy_policy_laszlo_bekessy_me_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_policy_attachment.laszlobekessy_deploy_attachment_laszlo_bekessy_me_cloudfront_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.laszlobekessy_deploy_attachment_laszlo_bekessy_me_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_route53_record.bekessy_me_a_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.laszlo_bekessy_me_a_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.laszlo_bekessy_me](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.laszlo_bekessy_me_s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.laszlo_bekessy_me_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_website_configuration.laszlo_bekessy_me_s3_website_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_acm_certificate.bekessy_me_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_iam_user.laszlobekessy_deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |
| [aws_route53_zone.bekessy_me_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_s3_bucket.laszlobekessy_cloudfront_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_laszlo_bekessy_me_cloudfront_domain_name"></a> [laszlo\_bekessy\_me\_cloudfront\_domain\_name](#output\_laszlo\_bekessy\_me\_cloudfront\_domain\_name) | n/a |
| <a name="output_laszlo_bekessy_me_cloudfront_id"></a> [laszlo\_bekessy\_me\_cloudfront\_id](#output\_laszlo\_bekessy\_me\_cloudfront\_id) | ==================================== # laszlo.bekessy.me ==================================== |
<!-- END_TF_DOCS -->