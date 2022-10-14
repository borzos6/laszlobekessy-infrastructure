# Routing

## Importing existing resources
- Route53 Zone: `npm run import module.routing.aws_route53_zone.xxx_com_zone <<RESOURCE ID>>`
- Route53 Record: `npm run import module.routing.aws_route53_record.email_xxx_com_cname_record <<ZONE ID>>_email.xxx.com_CNAME_`
    - `npm run import module.routing.aws_route53_record.xxx_com_ns_record <<ZONE ID>>_xxx.com_NS_`
    - `npm run import module.routing.aws_route53_record.xxx_com_soa_record <<ZONE ID>>_xxx.com_SOA_`
    - `npm run import module.routing.aws_route53_record.xxx_com_caa_record <<ZONE ID>>_xxx.com_CAA_`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.us_east_1"></a> [aws.us\_east\_1](#provider\_aws.us\_east\_1) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.bekessy_me_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.bekessy_me_us_east_1_certificate_dns_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.bekessy_me_caa_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.bekessy_me_ns_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.bekessy_me_soa_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.bekessy_me_us_east_1_certificate_dns_validation_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.bekessy_me_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->