resource "aws_security_group" "sg" {
  name        = "${var.project}-${terraform.workspace}"
  description = "Allow SSH"
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
    Name      = "${var.project}-${terraform.workspace}"
    terraform = true
  }
}

resource "aws_instance" "Servers" {
  count = length(var.instance_type)
  ami           = ""
  vpc_security_group_ids = [aws_security_group.sg.id]
  instance_type = "t3.small"
  tags = {
    Name      = "${var.project}-${terraform.workspace}-${var.instance_type[count.index]}"
    terraform = true
  }
}