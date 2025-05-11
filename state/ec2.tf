resource "aws_security_group" "AllowAll" {
  name        = "Allow All traffic"
  description = "Allow all incoming and outgoing traffic"
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

  tags = {
    Name = "AwsProject"
  }
}

resource "aws_instance" "MyFirstVM" {
  ami           = local.ami_id
  vpc_security_group_ids = [aws_security_group.AllowAll.id]
  instance_type = local.instance_type
  tags = {
    Name = "AwsProject-tf"
  }
}