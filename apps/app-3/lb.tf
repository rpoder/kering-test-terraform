resource "aws_lb_target_group" "tg" {
  name     = "${var.project_name}-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb" "lb" {
  name               = "${var.project_name}-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = var.public_subnets

  enable_deletion_protection = true

  tags = {
    Name       = "${var.project_name}-LB"
    ProjetName = var.project_name
  }
}
