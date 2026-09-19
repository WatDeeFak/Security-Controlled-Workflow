resource "aws_security_group" "this" {
  name        = "secure-admin-sg"
  description = "Security group for controlled administrative access"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from trusted network"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "secure-admin-sg"
  }
}