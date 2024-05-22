data "aws_vpc" "vpc" {
  tags = {
    Name = "shared-services"
  }
}
locals {
  vpc_id = split("/",data.aws_vpc.vpc.arn).1
}

resource "aws_security_group" "sg" {
  name   = "${var.project_name}-SG"
  vpc_id = local.vpc_id
  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port   = ingress.value.from_port
	  to_port = ingress.value.to_port
	  protocol = ingress.value.protocol
	  cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "${var.project_name}-SG"
    ProjetName = var.project_name
  }
}
