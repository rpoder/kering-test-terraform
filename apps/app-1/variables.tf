variable "region" {
  default     = "eu-west-3"
  description = "AWS Region"
  type        = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}
