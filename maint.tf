terraform {
  required_version = "1.10.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "base-aws-network-and-server-yossy"
    region       = "ap-northeast-1"
    key          = "terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      "Terraform" = true
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "main"
  }
}
