
resource "aws_ecs_task_definition" "td" {
  family                   = "${var.project_name}-TD"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  task_role_arn            = aws_iam_role.service_role.arn
  execution_role_arn       = aws_iam_role.service_role.arn

  container_definitions = jsonencode([
    {
      name      = "my-nginx"
      image     = "nginx:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      healthcheck : {
        command : ["CMD-SHELL", "echo 'healthy' || exit 1"]
      }
    },
  ])
}
