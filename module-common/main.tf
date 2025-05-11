resource "aws_instance" "aws_example" {
  ami           = "ami-058a8a5ab36292159"
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "ExampleInstance" # Tag the instance with a Name tag for easier identification
  }
}