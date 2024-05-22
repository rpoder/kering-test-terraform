data "aws_ecs_cluster" "cluster" {
  cluster_name = var.cluster_name
}

resource "aws_ecs_service" "service" {
  name            = "${var.project_name}-SVC"
  cluster         = data.aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.td.arn
  desired_count   = 1
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [aws_security_group.sg.id]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "my-nginx"
    container_port   = 80
  }
  tags = {
    Name       = "${var.project_name}-SG"
    ProjetName = var.project_name
  }
}
