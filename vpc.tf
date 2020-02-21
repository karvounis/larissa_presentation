module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v2.0"

  create_vpc = true

  name = "presentation-vpc"
  cidr = "20.0.0.0/16"

  azs            = ["eu-central-1a", "eu-central-1b"]
  public_subnets = ["20.0.1.0/24", "20.0.2.0/24"]

  tags = {
    Terraform = "true"
    Scope     = "presentation"
    Owner     = "karvounis"
  }
}
