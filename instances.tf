module "aws_presentation" {
  // Relative path for the module
  source = "./modules/aws_presentation"

  // Defines how many instances will be created
  aws_instances_count = var.aws_instances_count

  # -------------------- Instances specific Variables  -------------------------
  ami_id                           = data.aws_ami.ubuntu-18_04.id
  instances_vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_80.id,
    aws_security_group.allow_only_from_lb.id
  ]
  instance_tags                    = var.instance_tags
  key_name                         = var.key_name

  # ---------------- Load balancer specific Variables --------------------------
  create_lb             = var.create_lb
  lb_security_group_ids = [
    aws_security_group.allow_80.id
  ]
  vpc_subnet_ids        = module.vpc.public_subnets
  vpc_id                = module.vpc.vpc_id
}
