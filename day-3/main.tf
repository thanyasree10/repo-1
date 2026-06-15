resource "aws_instance" "name" {
    ami           = "ami-0521cb2d60cfbb1a6"
    instance_type = "t2.medium"
    tags = {
        Name = "Terraform-0900AM"
    }
}