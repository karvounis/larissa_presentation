variable "nginx_instances_count" {
  type        = number
  description = "Number of aws_instances that we want to have"
}

variable "ami_id" {
  type = string
  description = "The AMI ID that the instances are going to use"
}

variable "key_name" {
  type = string
  description = "Name of the SSH key that you attach to the instances"
}
//
//variable "security_groups_names" {
//  type = list(string)
//  description = "A list of the names of security groups"
//}

variable "instance_tags" {
  type = map(string)
  description = "A map of tags you want to add to the instances"
}
