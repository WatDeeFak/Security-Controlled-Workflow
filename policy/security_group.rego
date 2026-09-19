package terraform.security_group

deny contains msg if {
  resource := input.resource_changes[_]

  resource.type == "aws_security_group"

  ingress := resource.change.after.ingress[_]

  ingress.from_port <= 22
  ingress.to_port >= 22

  ingress.protocol == "tcp"

  cidr := ingress.cidr_blocks[_]

  cidr == "0.0.0.0/0"

  msg := "SSH (TCP/22) must not be exposed to 0.0.0.0/0"
}