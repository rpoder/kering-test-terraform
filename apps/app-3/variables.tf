variable "project_name" {
  default = "test-ronan"
  type    = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "cluster_name" {
  default = "test_ronan"
  type    = string
}

variable "route53_zone_id" {
  type = string
}

variable "ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
