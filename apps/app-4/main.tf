resource "aws_iam_role" "role" {
  name = "test_role"

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
    Name = "test_ronan"
  }
}

resource "aws_iam_role_policy_attachment" "rolo_policy" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}
