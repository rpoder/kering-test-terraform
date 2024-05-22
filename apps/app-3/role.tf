resource "aws_iam_role" "role" {
  name = "${var.project_name}-ROLE"

  assume_role_policy = jsonencode(
    {
      "Version" : "2008-10-17",
      "Statement" : [
        {
          "Sid" : "",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "ecs.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )

  tags = {
    Name        = "${var.project_name}-ROLE"
    ProjectName = var.project_name
  }
}

resource "aws_iam_role_policy_attachment" "role_policy" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}
