variable "nginx_instances_count" {
  description = "Number of aws_instances that we want to have"
  type        = number
  default     = 0
}

variable "ami_id" {
  description = "The AMI ID that the instances are going to use"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key that you attach to the instances"
  type        = string
  default     = ""
}

variable "instances_security_group_names" {
  description = "A list of the names of security groups to attach to instances"
  type        = list(string)
  default     = []
}

variable "lb_security_group_ids" {
  description = "A list of the ids of security groups to attach to the load balancer"
  type        = list(string)
  default     = []
}

variable "lb_subnet_ids" {
  description = "A list of the ids of the subnets to attach to the load balancer"
  type        = list(string)
  default     = []
}

variable "instance_tags" {
  description = "A map of tags you want to add to the instances"
  type        = map(string)
  default     = {}
}

variable "create_lb" {
  description = "Should be true if you want to create a load balancer"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "ID of the VPC to spin up the resources inside"
  type        = string
  default     = ""
}
