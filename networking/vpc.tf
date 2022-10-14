# ==================================== #
# US-EAST-1
# ==================================== #
resource "aws_vpc" "vpc_us_east_1" {
  provider                         = aws.us_east_1
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "172.31.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    Name = "vpc_us_east_1"
  }
}

# ==================================== #
# EU-CENTRAL-1
# ==================================== #
resource "aws_vpc" "vpc_eu_central_1" {
  provider                         = aws.eu_central_1
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "172.31.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    Name = "vpc_eu_central_1"
  }
}
