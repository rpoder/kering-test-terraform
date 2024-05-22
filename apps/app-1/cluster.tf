resource "aws_ecs_cluster" "test-cluster" {
  name = "test-cluster"
}

resource "aws_ecs_service" "test-service" {
  name            = "test-service"
  cluster         = aws_ecs_cluster.test-cluster.id
  task_definition = aws_ecs_task_definition.my-first-td.arn
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [aws_security_group.test-cluster-sg.id]
  }
  desired_count = 1
}


