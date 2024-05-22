resource "aws_lb" "lb" {
  name               = "${var.project_name}-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name       = "${var.project_name}-LB"
    ProjetName = var.project_name
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.project_name}-TG"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn

  port     = "80"
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


