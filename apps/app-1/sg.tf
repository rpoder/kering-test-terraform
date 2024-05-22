resource "aws_security_group" "test-cluster-sg" {
  name = "test-service-SG"
  vpc_id = "vpc-0dd83e775f5555e9b"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
