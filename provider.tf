provider "aws" {
  region  = "eu-central-1"
  version = "~> 2.0"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12"
}

data "aws_caller_identity" "current" {}
