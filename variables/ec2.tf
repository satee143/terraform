resource "aws_instance" "Linux-VM" {
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.Allow-All.id]
  instance_type          = var.instance_type

  tags = var.ec2-tags
}

resource "aws_security_group" "Allow-All" {
  name        = var.security_group_name
  description = var.secuirty_group_description

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blcoks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blcoks
  }
  tags = var.ec2-tags
}