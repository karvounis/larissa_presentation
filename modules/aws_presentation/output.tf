output "my_web_server_info" {
  value = {
    "hostname": aws_instance.my_web_server.*.id
    "public_ip": aws_instance.my_web_server.*.public_ip
    "private_ip": aws_instance.my_web_server.*.private_ip
  }
}

output "this_load_balancer_target_id" {
  value = aws_alb_target_group_attachment.larissa_dev_target_group_attachment.*.target_id
}

output "this_load_balancer_dns_name" {
  value = aws_lb.this.*.dns_name
}
