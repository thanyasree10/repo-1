resource "aws_instance" "name" {
  for_each = toset(var.env)

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = each.key
  }
}