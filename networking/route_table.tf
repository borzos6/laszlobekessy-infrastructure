# ==================================== #
# US-EAST-1
# ==================================== #
resource "aws_route_table" "route_table_us_east_1" {
  provider = aws.us_east_1
  vpc_id   = aws_vpc.vpc_us_east_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_us_east_1.id
  }

  tags = {
    Name = "default-route-table"
  }
}

# ==================================== #
# EU-CENTRAL-1
# ==================================== #
resource "aws_route_table" "route_table_eu_central_1" {
  provider = aws.eu_central_1
  vpc_id   = aws_vpc.vpc_eu_central_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_eu_central_1.id
  }

  tags = {
    Name = "default-route-table"
  }
}
