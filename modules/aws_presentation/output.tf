output "my_web_server_info" {
  value = {
    "ids": aws_instance.my_web_server.*.id
    "tags": aws_instance.my_web_server.*.tags
    "public_ips": aws_instance.my_web_server.*.public_ip
    "private_ips": aws_instance.my_web_server.*.private_ip
  }
}

output "this_load_balancer_target_id" {
  value = aws_alb_target_group_attachment.larissa_dev_target_group_attachment.*.target_id
}

output "this_load_balancer_dns_name" {
  value = aws_lb.this.*.dns_name
}
