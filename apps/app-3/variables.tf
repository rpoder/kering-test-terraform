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
