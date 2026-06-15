# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev-vpc"
  }
}

# Security Group
resource "aws_security_group" "allow_ports" {
  name        = "allow-ports"
  description = "Multiple inbound rules using for_each"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.allowed_ports

    content {
      description = "Allow Port ${ingress.key}"

      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"

      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ports"
  }
}