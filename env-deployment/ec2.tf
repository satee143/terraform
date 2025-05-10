resource "aws_instance" "servers" {
  count = length(var.servers)
  ami           = var.ami
  instance_type = var.servers[count.index]=="SQL" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.aws-sg.id]
  tags = {
    Name = "${var.project}-${var.servers[count.index]}-${var.environment}"
  }
}