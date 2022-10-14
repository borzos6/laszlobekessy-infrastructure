# Personal Infrastructure
This repository contains infrastructure as code (in Terraform) for personal use designed to deploy on Amazon AWS.

## Table of Contents
- [Setup](#setup)
  - [Install](#install)
  - [Credentials](#credentials)
  - [Encryption](#encryption)
  - [Init](#init)
  - [Upgrade](#upgrade)
- [Workflow](#workflow)
  - [Using the predefined npm commands](#using-the-predefined-npm-commands)
  - [Using the full capabilities of terraform](#using-the-full-capabilities-of-terraform)
  - [Naming conventions](#naming-conventions)
  - [Creating a new module](#creating-a-new-module)
  - [Importing existing resources](#importing-existing-resources)
  - [Remote state](#remote-state)
- [Terraformer](#commands)
  - [Install](#install)
    - [Download Terraformer](#download-terraformer)
    - [Download AWS Provider](#download-aws-provider)
  - [Usage](#usage)
- [Backlog](#backlog)
- [Repository content](#repository-content)

# Setup
## Install
- *(requirement)* Install Terraform CLI (https://learn.hashicorp.com/tutorials/terraform/install-cli)
- *(requirement)* Install AWS CLI v2 (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- *(requirement)* Install Terraform-docs (https://terraform-docs.io/user-guide/installation/)
  - Mac ARM example
    ```bash 
    curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-darwin-arm64.tar.gz
    tar -xzf terraform-docs.tar.gz
    chmod +x terraform-docs
    mv terraform-docs /usr/local/bin/terraform-docs
    ```
- *(requirement)* Install GNU PGP = GPG (https://gnupg.org/download/) for encryption
- *(requirement)* Install JQ for terraform output processing (https://stedolan.github.io/jq/download/)

## Credentials
- You need to have access to the laszlobekessy-terraform IAM user. Either get the credentials or create a new user/access key to be able to apply changes

## Encryption
- During initialization you'll need a PGP key for encrypting passwords and secret attributes
- Option A) You use a repository that has been set up
  - Find the `public-key-binary.gpg` and put it into the `/pgp` folder in this repo
- Option B) You created a new repository
  - Create: `gpg --batch --gen-key pgp/key-gen-template`
  - Export: `gpg --output pgp/public-key-binary.gpg --export laszlo@bekessy.me`
  - Full tutorial here: https://menendezjaume.com/post/gpg-encrypt-terraform-secrets/
  - Disclaimer: Keys have expiry dates. If you try to use the keys after the expiration, IAM will deny it with a `Error encrypting IAM Access Key Secret: error setting up encryption for PGP message: openpgp: invalid argument: cannot encrypt a message to key id xxxx because it has no encryption keys` error. In this case change the expiry date of the key
    - `gpg -k`: get the key uid
    - `gpg --edit-key uid`
      - command> `list`
      - command> `key [subkey]`
      - command> `expire`
      - command> `save` (Passphrase in the pgp/key-gen-template file)

## Init
- `npm run init`
- or `npm run init-reconfigure`

## Upgrade
- To upgrade terraform, you need to install it on your machine (homebrew, manual, either way) [Link](https://www.terraform.io/downloads)
- To upgrade providers (especially AWS), set the new provider version in the `providers.tf` files **all accross the whole repository**. Then run `terraform init -upgrade`.

# Workflow
## Using the predefined npm commands
- Use the predefined npm commands to go through the workflow. This covers 90% of the cases where you don't want to use special terraform attributes
  - If new module created see [the docs here](#creating-a-new-module)
  - Change/Add/Remove then necessary items
  - These individual commands are blended into a single one: `npm run prepare`
    - Format: `npm run format`
    - Validate: `npm run validate`
    - Generate docs: `npm run adoc` (update docs for a all modules). Note: for individual update, use `npm run doc <<MODULE_NAME>>`
  - Plan:
    - `npm run plan` (plan all modules)
    - `npm run tplan <<MODULE_NAME>>` (plan a single module)
  - Apply if everything's okay: `npm run apply`
  - Decrypt secrets: `sh pgp/decrypt-secrets.sh`

## Using the full capabilities of terraform
 - Run `export AWS_PROFILE=laszlobekessy-terraform`
 - All terraform commands will work after this.
 - Some help with commands
  - `terraform plan`: In case you want to save the plan to ensure apply will definitely makes the same changes run `terraform plan -out=tf.out` for everything or `terraform plan -target=module.production.infra -out=tf.out` for just one target
  - `terraform apply`: Applying from *plan* that you've ran before: `terraform apply tf.out`

## Naming Conventions
- use _ in resource names (`resource "aws_iam_role" "default_ecs_role"`)
- use - in visible names (`"${var.project}-${var.environment}"`)
- use full names (`"${var.project}-security-group"`) instead of shourtcuts (`"${var.project}-sg"`) if possible
- make the code self-documenting, don't be afraid of using long names if it describes the code better

## Creating a new module
- Create the subfolder
- Add `providers.tf` (copy paste from an existing module)
- Describe resources
- Run `npm run init`
- Use the standard [workflow](#workflow)

## Importing existing resources
- In most of the cases you can do it with the npm command, use `npm run import ARG1 ARG2`, where ARG1 is the resource and ARG2 is the existing ID. But these statements may differ between resources, so use these examples as templates:
  - Route53 Zone: `npm run import module.routing.aws_route53_zone.xxx_com_zone <<RESOURCE ID>>`
  - Route53 Record: `npm run import module.routing.aws_route53_record.email_xxx_com_cname_record <<ZONE ID>>_email.xxx.com_CNAME_`
  - IAM Group policy attachment: `npm run import module.security.aws_iam_group_policy_attachment.admin_AdministratorAccess admin/arn:aws:iam::aws:policy/AdministratorAccess`
  - CloudFront: `npm run import module.xxx.aws_cloudfront_distribution.xxx_com_cloudfront_distribution E35MSVS3R50KQU`
  - WAFv2: `npm run import module.xxx.aws_wafv2_web_acl.xxx_hotlink_protection 57c0f1b8-e2f6-4df4-af06-1db00363ad40/xxx-hotlink-protection/CLOUDFRONT`
- If you want to execute a custom command, see the [Using the full capabilities of terraform](#using-the-full-capabilities-of-terraform) section

## Remote state
- Encrypted remote state is stored separately in a private S3 bucket called `laszlobekessy-terraform-state` (with versioning turned ON).
- Moving resources between modules: `terraform state mv module.modulename.resource1.resource1name module.modulename.resource2.resource2name`
- Listing all remote states: `terraform state list`

# Repository content

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.34.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_laszlo_bekessy_me"></a> [laszlo\_bekessy\_me](#module\_laszlo\_bekessy\_me) | ./laszlo_bekessy_me | n/a |
| <a name="module_logging"></a> [logging](#module\_logging) | ./logging | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./networking | n/a |
| <a name="module_routing"></a> [routing](#module\_routing) | ./routing | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./security | n/a |
| <a name="module_utility"></a> [utility](#module\_utility) | ./utility | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_access_keys"></a> [iam\_access\_keys](#output\_iam\_access\_keys) | The Access keys and secrets for the IAM users |
| <a name="output_laszlo_bekessy_me_website_cloudfront_data"></a> [laszlo\_bekessy\_me\_website\_cloudfront\_data](#output\_laszlo\_bekessy\_me\_website\_cloudfront\_data) | The CloudFront distributions |
<!-- END_TF_DOCS -->