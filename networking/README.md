# Networking 
- Network resources are created by default on launch of an AWS profile. It is the best to import these first and then modify the configuration later. The easiest way to do that is to do a terraformer diff and import them one by one. *Note: There's a VPC structure for each region, so if you use multiple, you need to import them all.*
- For importing, use this order (and example commands)
  1. VPC: `npm run import module.networking.aws_vpc.vpc_us_east_1 vpc-22283845`
  2. Internet Gateway: `npm run import module.networking.aws_internet_gateway.igw_us_east_1 igw-c26eb4a5`
  3. Subnets: `npm run import module.networking.aws_subnet.subnet_1_us_east_1 subnet-09f73535`
  4. Security group: *Note: don't change the default, it cannot be deleted or modified* `npm run import module.networking.aws_security_group.default_security_group_vpc_us_east_1 sg-85689af8`
  5. Route table: `npm run import module.networking.aws_route_table.route_table_us_east_1 rtb-3e87ff58`
  6. NACL: `npm run import module.networking.aws_default_network_acl.acl_us_east_1 acl-e8a87f8e`

# Content

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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_network_acl.acl_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_default_network_acl.acl_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_internet_gateway.igw_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_internet_gateway.igw_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.route_table_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.route_table_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_security_group.default_security_group_vpc_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.default_security_group_vpc_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.laszlobekessy_internal_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.subnet_1a_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1a_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1b_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1b_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1c_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1c_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1d_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1e_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_1f_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc_eu_central_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc.vpc_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->