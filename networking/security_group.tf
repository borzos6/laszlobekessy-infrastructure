# ==================================== #
# US-EAST-1
# ==================================== #
resource "aws_security_group" "default_security_group_vpc_us_east_1" {
  provider    = aws.us_east_1
  name        = "default"
  vpc_id      = aws_vpc.vpc_us_east_1.id
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = -1
    self        = false
    to_port     = 0
  }

  ingress {
    from_port = 0
    protocol  = -1
    self      = true
    to_port   = 0
  }

  tags = {
    Name = "default-us-east-1"
  }
}

# ==================================== #
# EU-CENTRAL-1
# ==================================== #
resource "aws_security_group" "default_security_group_vpc_eu_central_1" {
  provider    = aws.eu_central_1
  name        = "default"
  vpc_id      = aws_vpc.vpc_eu_central_1.id
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = -1
    self        = false
    to_port     = 0
  }

  ingress {
    from_port = 0
    protocol  = -1
    self      = true
    to_port   = 0
  }

  tags = {
    Name = "default-eu-central-1"
  }
}

resource "aws_security_group" "laszlobekessy_internal_all" {
  provider    = aws.eu_central_1
  name        = "laszlobekessy-internal-all"
  description = "Allow all internal traffic"
  vpc_id      = aws_vpc.vpc_eu_central_1.id

  ingress {
    description = "All traffic from local IPs"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = false
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = false
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "laszlobekessy-internal-all"
  }
}
