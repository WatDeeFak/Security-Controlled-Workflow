resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "security-controlled-vpc"
  }
}