resource "aws_instance" "my_web_server" {
  count = var.aws_instances_count

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = merge({
    Name = "larissa-devs-${count.index}"
  }, var.instance_tags)

  vpc_security_group_ids = var.instances_vpc_security_group_ids
  key_name               = var.key_name
  subnet_id              = var.vpc_subnet_ids[random_integer.subnet_index_choice[count.index].result]
}

resource "random_integer" "subnet_index_choice" {
  count = var.aws_instances_count

  min = 0
  max = length(var.vpc_subnet_ids) - 1
}
