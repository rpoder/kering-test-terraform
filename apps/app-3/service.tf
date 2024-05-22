data "aws_ecs_cluster" "cluster" {
  cluster_name = "test_ronan"
}

resource "aws_ecs_service" "service" {
  name            = "${var.project_name}-SVC"
  cluster         = data.aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.td.arn
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [aws_security_group.sg.id]
  }
  desired_count = 1
  load_balancer {
	target_group_arn = aws_ecs_task_definition.td.arn
	container_name = "${var.project_name}-CONTAINER"
	container_port = 80
  }
}
