resource "aws_security_group" "Allow-All" {
  name        = "ASG-Allow-SSH"
  description = "Allow only SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Expense-ASG-SSH"
    Project     = "Expense"
    Environment = "Dev"

  }
}

resource "aws_instance" "ExpenseVM" {
  count                  = 3
  ami                    = "ami-058a8a5ab36292159"
  vpc_security_group_ids = [aws_security_group.Allow-All.id]
  instance_type          = "t3.micro"
  tags = {
    Name        = var.server_type[count.index]
    Project     = "Expense"
    Environment = "Dev"

  }
}