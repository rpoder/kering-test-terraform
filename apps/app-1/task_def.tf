resource "aws_ecs_task_definition" "my-first-td" {
  family                   = "my-first-td"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  task_role_arn = "arn:aws:iam::905418349257:role/ecsTaskExecutionRole"
#   execution_role_arn = "arn:aws:iam::905418349257:role/ecsTaskExecutionRole"

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
    },
  ])

  #   placement_constraints {
  #     type       = "memberOf"
  #     expression = "attribute:ecs.availability-zone in [eu-west-1a, eu-west-1b, eu-west-1c]"
  #   }
}
