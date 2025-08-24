variable "instance_type" {
  description = "Type of Ec2 instance"
  type        = string
  default     = "t3.micro"
}

variable "ip_protocol" {
  type    = string
  default = "tcp"
}

variable "cidr_block" {
  default = "0.0.0.0/0"
}