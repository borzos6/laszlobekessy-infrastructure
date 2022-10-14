
# ==================================== #
# US-EAST-1
# ==================================== #
resource "aws_subnet" "subnet_1a_us_east_1" {
  provider                        = aws.us_east_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.0.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_us_east_1.id
  tags = {
    Name = "us-east-1a default"
  }
}

resource "aws_subnet" "subnet_1b_us_east_1" {
  provider                        = aws.us_east_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.80.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_us_east_1.id
  tags = {
    Name = "us-east-1b default"
  }
}

resource "aws_subnet" "subnet_1c_us_east_1" {
  provider                        = aws.us_east_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.16.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_us_east_1.id
  tags = {
    Name = "us-east-1c default"
  }
}

resource "aws_subnet" "subnet_1d_us_east_1" {
  provider                        = aws.us_east_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.32.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_us_east_1.id
  tags = {
    Name = "us-east-1d default"
  }
}

resource "aws_subnet" "subnet_1e_us_east_1" {
  provider                        = aws.us_east_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.64.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_us_east_1.id
  tags = {
    Name = "us-east-1e default"
  }
}

resource "aws_subnet" "subnet_1f_us_east_1" {
  provider                        = aws.us_east_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.48.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_us_east_1.id
  tags = {
    Name = "us-east-1f default"
  }
}


# ==================================== #
# EU-CENTRAL-1
# ==================================== #
resource "aws_subnet" "subnet_1a_eu_central_1" {
  provider                        = aws.eu_central_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.16.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_eu_central_1.id
  tags = {
    Name = "eu-central-1a default"
  }
}

resource "aws_subnet" "subnet_1b_eu_central_1" {
  provider                        = aws.eu_central_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.32.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_eu_central_1.id
  tags = {
    Name = "eu-central-1b default"
  }
}

resource "aws_subnet" "subnet_1c_eu_central_1" {
  provider                        = aws.eu_central_1
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.0.0/20"
  map_customer_owned_ip_on_launch = false
  customer_owned_ipv4_pool        = ""
  outpost_arn                     = ""
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.vpc_eu_central_1.id
  tags = {
    Name = "eu-central-1c default"
  }
}
