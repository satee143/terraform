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
  ami           = data.aws_ami.ami_id.id
  vpc_security_group_ids = [aws_security_group.AllowAll.id]
  instance_type = "t3.micro"
  tags = {
    Name = "AwsProject"
  }
}