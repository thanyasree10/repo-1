resource "aws_instance" "name" {
  count = length(var.env)

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.env[count.index]
  }
}