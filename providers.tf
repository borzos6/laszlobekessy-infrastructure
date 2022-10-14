terraform {
  backend "s3" {
    encrypt = true
    region  = "eu-central-1"
    bucket  = "laszlobekessy-terraform-state"
    key     = "production-terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "aws" {
  alias   = "eu_central_1"
  region  = "eu-central-1"
  profile = "laszlobekessy-terraform"
  default_tags {
    tags = { terraformed = true }
  }
}

provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"
  profile = "laszlobekessy-terraform"
  default_tags {
    tags = { terraformed = true }
  }
}
