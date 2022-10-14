# ==================================== #
# US-EAST-1
# ==================================== #
resource "aws_internet_gateway" "igw_us_east_1" {
  provider = aws.us_east_1
  vpc_id   = aws_vpc.vpc_us_east_1.id
}

# ==================================== #
# EU-CENTRAL-1
# ==================================== #
resource "aws_internet_gateway" "igw_eu_central_1" {
  provider = aws.eu_central_1
  vpc_id   = aws_vpc.vpc_eu_central_1.id
}