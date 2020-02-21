module "aws_presentation" {
  source = "./modules/aws_presentation"

  nginx_instances_count = 0

  ami_id                = data.aws_ami.ubuntu-18_04.id
  instances_security_group_names = [
    aws_security_group.allow_ssh.name,
    aws_security_group.allow_80.name,
    aws_security_group.allow_only_from_lb.name
  ]

  instance_tags = var.instance_tags
  key_name      = var.key_name

  create_lb             = false
  lb_security_group_ids = [
    aws_security_group.allow_80.id
  ]

  lb_subnet_ids = module.vpc.public_subnets
  vpc_id        = module.vpc.vpc_id
}
