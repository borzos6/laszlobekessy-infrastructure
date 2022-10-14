<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.eu_central_1"></a> [aws.eu\_central\_1](#provider\_aws.eu\_central\_1) | ~> 4.0 |
| <a name="provider_aws.us_east_1"></a> [aws.us\_east\_1](#provider\_aws.us\_east\_1) | ~> 4.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.laszlobekessy_deploy_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.admin_AdministratorAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.cloudwatch_logging_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cloudwatch_metrics_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3_console_generic_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.laszlobekessy_deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.laszlobekessy_human_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.aws_human_user_change_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.aws_human_user_s3_console_generic_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [local_file.pgp_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_laszlobekessy_deploy_access_key"></a> [laszlobekessy\_deploy\_access\_key](#output\_laszlobekessy\_deploy\_access\_key) | n/a |
| <a name="output_laszlobekessy_deploy_secret_key"></a> [laszlobekessy\_deploy\_secret\_key](#output\_laszlobekessy\_deploy\_secret\_key) | n/a |
| <a name="output_laszlobekessy_deploy_user_name"></a> [laszlobekessy\_deploy\_user\_name](#output\_laszlobekessy\_deploy\_user\_name) | laszlobekessy-deploy |
| <a name="output_laszlobekessy_human_users"></a> [laszlobekessy\_human\_users](#output\_laszlobekessy\_human\_users) | laszlobekessy-human\_users |
<!-- END_TF_DOCS -->