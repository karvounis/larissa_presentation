resource "aws_instance" "my_web_server" {
  count = var.nginx_instances_count

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = merge({
    Name = "larissa-devs-${count.index}"
  }, var.instance_tags)

  security_groups = var.instances_security_group_names
  key_name        = var.key_name
}
