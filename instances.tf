module "aws_presentation" {
  // Relative path for the module
  source = "./modules/aws_presentation"

  // Defines how many instances will be created
  aws_instances_count = 0

  # -------------------- Variables relevant for the instances ------------------
  ami_id                           = data.aws_ami.ubuntu-18_04.id
  instances_vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_80.id,
    aws_security_group.allow_only_from_lb.id
  ]
  instance_tags                    = var.instance_tags
  key_name                         = var.key_name

  # ---------------- Variables relevant for the load balancer ------------------
  // Set to true to create the necessary infrastructure for our Load Balancer
  create_lb             = false
  lb_security_group_ids = [
    aws_security_group.allow_80.id
  ]
  vpc_subnet_ids        = module.vpc.public_subnets
  vpc_id                = module.vpc.vpc_id
}
