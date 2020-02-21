variable "nginx_instances_count" {
  description = "Number of aws_instances that we want to have"
  type        = number
}

variable "key_name" {
  description = "Name of the SSH key that you attach to the instances"
  type        = string
}

variable "instance_tags" {
  description = "A map of tags you want to add to the instances"
  type        = map(string)
}
