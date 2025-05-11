resource "aws_security_group" "AllowSSH" {
  name        = "AllowSSH"
  description = "Allow ssh traffic"
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "Servers" {
  for_each      = var.instance_type
  ami           = "ami-058a8a5ab36292159"
  vpc_security_group_ids = [aws_security_group.AllowSSH.id]
  instance_type = each.value
  tags = {
    Name = each.key
  }
}